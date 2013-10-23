module ResponseMate
  module Formatter
    def render_recording_body(key); format_body load_recording(key) end

    private
    def format_body(recording)
      %(<pre class="highlight"><code class="language-javascript">%s</code></pre>) %
        JSON.pretty_generate(JSON.parse(recording[:body]))
    end

    def load_recording(key); YAML.load_file("./output/responses/#{key}.yml") end
  end
end

include ResponseMate::Formatter
