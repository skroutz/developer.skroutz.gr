module ResponseMate
  module Formatter
    FILTERED_PARAMS = [ :oauth_token ]

    def render_recording(key, options = {})
      if !options[:only]
        options[:only] = [:request, :description, :status, :body]
      end

      recording = load_recording key
      result = ""
      result << format_request(recording) if options[:only].include?(:request)
      result << format_description(recording) if options[:only].include?(:description)
      result << format_status(recording) if options[:only].include?(:status)
      result << format_body(recording) if options[:only].include?(:body)

      result
    end

    def render_recording_body(key); format_body load_recording(key) end

    private
    def format_request(recording)
      format_params(recording[:request])
    end

    def format_params(hash)
      output = '<ul class="request-params">'
      output << hash.map { |k, v|
        val = v.is_a?(Hash) ? format_params(v) : v
        val = '[FILTERED]' if FILTERED_PARAMS.include? k.to_sym

        "<li><span class=\"label\">#{k}</span>: #{val}</li>"
      }.join()
      output << "</ul>"
    end

    def format_status(recording)
      %(<pre class="headers"><code>Status: #{recording[:status]}</code></pre>\n)
    end

    def format_body(recording)
      begin
        content = JSON.pretty_generate(JSON.parse(recording[:body]))
      rescue JSON::ParserError
        content = recording[:body]
      end
      %(<pre class="highlight"><code class="language-javascript">%s</code></pre>) %
        content
    end

    def format_description(recording)
      return '' if !recording[:meta] || !recording[:meta][:description]

      description = recording[:meta][:description]

      "<div class='request-description'> Description: #{description}</div>"
    end

    def load_recording(key)
      YAML.load_file(ResponseMate.configuration.output_dir + "#{key}.yml").symbolize_keys
    rescue Errno::ENOENT
      STDOUT.print key.to_s.red << " key was not found, \n\t" <<
      "try Running " << "response_mate record\n\t".green <<
      "Use " << "response_mate list".green << " to view available keys\n"
    end
  end
end

include ResponseMate::Formatter
