# -*- encoding : utf-8 -*-
require 'pp'
require 'yajl/json_gem'
require 'stringio'
require 'cgi'
require 'securerandom'

require 'response_mate'
require 'response_mate-nanoc'

module Skroutz
  module Resources
    module Helpers
      STATUSES = {
        200 => '200 OK',
        201 => '201 Created',
        202 => '202 Accepted',
        204 => '204 No Content',
        205 => '205 Reset Content',
        301 => '301 Moved Permanently',
        302 => '302 Found',
        307 => '307 Temporary Redirect',
        304 => '304 Not Modified',
        401 => '401 Unauthorized',
        403 => '403 Forbidden',
        404 => '404 Not Found',
        405 => '405 Method not allowed',
        409 => '409 Conflict',
        422 => '422 Unprocessable Entity',
        500 => '500 Server Error'
      }

      AUTHORS = {
        :zorbash => '0fd95d31561c422c72926fcdc8e73114'
      }

      DefaultTimeFormat = "%B %-d, %Y".freeze

      def post_date(item)
        strftime item[:created_at]
      end

      def strftime(time, format = DefaultTimeFormat)
        attribute_to_time(time).strftime(format)
      end

      def gravatar_for(login)
        %(<img height="16" width="16" src="%s" />) % gravatar_url_for(login)
      end

      def gravatar_url_for(login)
        md5 = AUTHORS[login.to_sym]
        default = "https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png"
        "https://secure.gravatar.com/avatar/%s?s=20&d=%s" %
          [md5, default]
      end

      def headers(status, head = {})
        css_class = (status == 204 || status == 404) ? 'headers no-response' : 'headers'
        lines = ["Status: #{STATUSES[status]}"]
        head.each do |key, value|
          case key
            when :pagination
              lines << 'Link: <https://api.github.com/resource?page=2>; rel="next",'
              lines << '      <https://api.github.com/resource?page=5>; rel="last"'
            else lines << "#{key}: #{value}"
          end
        end

        # TODO: When Rate limit is enabled uncomment the following
        #lines << "X-RateLimit-Limit: 5000" unless head.has_key?('X-RateLimit-Limit')
        #lines << "X-RateLimit-Remaining: 4999" unless head.has_key?('X-RateLimit-Remaining')

        %(<pre class="#{css_class}"><code>#{lines * "\n"}</code></pre>\n)
      end

      def json(key)
        hash = case key
          when Hash
            h = {}
            key.each { |k, v| h[k.to_s] = v }
            h
          when Array
            key
          else Resources.const_get(key.to_s.upcase)
        end

        hash = yield hash if block_given?

        %(<pre class="highlight"><code class="language-javascript">) +
          JSON.pretty_generate(hash) + "</code></pre>"
      end

      def prepared_response(key)
        response = YAML.load_file("./output/responses/#{key}.yml")
        headers_output = headers(response[:status])
        body_content = JSON.pretty_generate(JSON.parse(response[:body]))
        body_output = %(<pre class="highlight"><code class="language-javascript">) +
          body_content + "</code></pre>"

        headers_output + body_output
      end

      def text_html(response, status, head = {})
        hs = headers(status, head.merge('Content-Type' => 'text/html'))
        res = CGI.escapeHTML(response)
        hs + %(<pre class="highlight"><code>) + res + "</code></pre>"
      end
    end
  end
end

include Skroutz::Resources::Helpers
