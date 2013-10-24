require 'faraday'
require 'faraday_middleware'
require 'addressable/uri'

module ResponseMate
  class Recorder
    class InvalidRequestStringError < ArgumentError; end

    HTTP_VERBS = %w(GET POST PUT PATCH DELETE HEAD OPTIONS)
    REQUEST_MATCHER = /^(?<verb>(#{HTTP_VERBS.join('|')})) (?<path>(.)*)$/im
    DEFAULT_HEADERS = {
      'User-Agent' => 'Response-Mate'
    }
    DEFAULT_REQUEST = {
      verb:'GET'
    }

    attr_accessor :base_url, :conn, :manifest

    def initialize(args)
      @requests_manifest = args[:requests_manifest] || ResponseMate.configuration.
        requests_manifest

      parse_requests_manifest

      @base_url = args[:base_url] || @manifest['base_url']
      initialize_connection
    end

    def record
      STDOUT.print "Base URL: #{@base_url}\n"
      STDOUT.print "Recording..\n"

      @manifest['requests'].compact.each do |request|
        process request['key'], request['request']
      end
    end

    private
    def parse_requests_manifest
      STDOUT.print "Reading request manifest: #{@requests_manifest}\n".underline
      @manifest = YAML.load_file(@requests_manifest)
    end

    def process(key, request)
      request = parse_request_string(request) if request.is_a? String
      request = parse_request_hash(request) if request.is_a? Hash
      STDOUT.print "#{request[:verb]}".cyan_on_black.bold <<  " #{request[:path]}\n"
      STDOUT.print "\tWith params #{request[:params]}\n" if !request[:params].nil?
      write_to_file(key, request, fetch(request))
    end

    def fetch(request)
      @conn.params = request[:params] if !request[:params].nil?
      @conn.send request[:verb].downcase.to_sym, "#{base_url}#{request[:path]}"
    rescue Faraday::Error::ConnectionFailed
      STDOUT.print "Is a server up and running at #{@base_url}?\n".red
    end

    def parse_request_string(request_string)
      raise InvalidRequestStringError if request_string !~ REQUEST_MATCHER
      { verb: $~[:verb] || DEFAULT_REQUEST[:verb] }.merge(extract_path_query($~[:path]))
    end

    def extract_path_query(str)
      parsed = Addressable::URI.parse(str)
      {
        path: parsed.path,
        params: parsed.query_values
      }
    end

    def parse_request_hash(hash)
      DEFAULT_REQUEST.merge(hash.symbolize_keys)
    end

    def format_request_string(request)
      "#{request[:verb]} #{request[:path]}"
    end

    def initialize_connection
      @conn = Faraday.new do |c|
        c.use FaradayMiddleware::FollowRedirects, limit: 5
        c.adapter Faraday.default_adapter
      end

      @conn.headers.merge(DEFAULT_HEADERS)
      set_default_headers_from_manifest
      @conn.url_prefix = base_url
      @conn
    end

    def set_default_headers_from_manifest
      if !@manifest['default_headers'].nil?
        @manifest['default_headers'].each_pair do |k, v|
          header_key = headerize(k)
          @conn.headers[header_key] = v
        end
      end
    end

    def write_to_file(key, request, response)
      File.open("#{ResponseMate.configuration.output_dir}#{key}.yml", 'w') do |f|
        f << {
          request: request.select { |_, v| !v.nil? },
          status: response.status,
          headers: response.headers,
          body: response.body
        }.to_yaml
      end
    end

    def headerize(string); string.split('_').map(&:capitalize).join('-') end
  end
end
