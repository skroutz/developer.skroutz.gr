# -*- encoding : utf-8 -*-
require 'pp'
require 'yajl/json_gem'
require 'stringio'
require 'cgi'
require 'securerandom'

require 'response_mate'
require 'response_mate/nanoc'

module Skroutz
  module Resources
    module Helpers
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
        default = "https://secure.gravatar.com/avatar/%s?s=20&d=%s" % [md5, default]
      end

      def render_code(snippet, language)
        %(<pre class="highlight"><code class="language-#{language}">#{CGI.escapeHTML snippet}</code></pre>)
      end

      def render_code_from_file(filename)
        content = YAML.load_file(File.expand_path(File.join('./output', 'code_examples', "#{filename}.yml")))
        render_code(content[:code], content[:language])
      end
    end
  end
end

include Skroutz::Resources::Helpers
