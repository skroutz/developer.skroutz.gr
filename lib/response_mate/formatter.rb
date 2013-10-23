module ResponseMate
  module Formatter
    def render_recording(key)
      recording = load_recording key
      format_status(recording) + format_body(recording)
    end

    def render_recording_body(key); format_body load_recording(key) end

    private
    def format_status(recording)
      %(<pre class="headers"><code>Status: #{recording[:status]}</code></pre>\n)
    end

    def format_body(recording)
      %(<pre class="highlight"><code class="language-javascript">%s</code></pre>) %
        JSON.pretty_generate(JSON.parse(recording[:body]))
    end

    def load_recording(key); YAML.load_file("./output/responses/#{key}.yml") end
  end
end

include ResponseMate::Formatter
