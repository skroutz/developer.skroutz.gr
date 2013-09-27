require 'faraday'

class ResponseMate
  class InvalidRequestStringError < ArgumentError; end

  Request_matcher = /^(?<verb>(GET|POST|PUT|PATCH|DELETE|OPTIONS)) (?<path>(.)*)$/im
  Api_accept_header = 'application/vnd.skroutz+json; version=3'
  User_agent = 'Response-Mate'

  attr_accessor :base_url, :conn

  def initialize(base_url)
    @base_url = base_url
    initialize_connection
  end

  def process(key, request)
    request = parse_request_string(request) if request.is_a?(String)
    p "Processing: #{request[:verb]} #{request[:path]}"
    write_to_file(key, fetch(request))
  end

  def fetch(request)
    @conn.send request[:verb].downcase.to_sym, "#{base_url}#{request[:path]}"
  end

  private
  def parse_request_string(request_string)
    raise InvalidRequestStringError if request_string !~ Request_matcher
    {
      verb: $~[:verb],
      path: $~[:path]
    }
  end

  def format_request_string(request)
    "#{request[:verb]} #{request[:path]}"
  end

  def initialize_connection
    @conn = Faraday.new
    @conn.headers['User-Agent'] = User_agent
    @conn.headers['Accept'] = Api_accept_header
    @conn.url_prefix = base_url
    @conn
  end

  def write_to_file(filename, response)
    File.open("./output/responses/#{filename}.yml", 'w') do |f|
      f << {
        status: response.status,
        body: response.body
      }.to_yaml
    end
  end
end
