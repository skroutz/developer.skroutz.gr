# -*- encoding : utf-8 -*-
require 'pp'
require 'yajl/json_gem'
require 'stringio'
require 'cgi'
require 'securerandom'

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

      def text_html(response, status, head = {})
        hs = headers(status, head.merge('Content-Type' => 'text/html'))
        res = CGI.escapeHTML(response)
        hs + %(<pre class="highlight"><code>) + res + "</code></pre>"
      end


      SINGLE_CATEGORY = {
        "category" => {
          "children_count" => 0,
          "family_id" => 11,
          "id" => 1442,
          "name" => "Ξαπλώστρες Κήπου & Βεράντας",
          "image_url" => "http://b.scdn.gr/images/categories/large/1442.jpg"
        }
      }

      CATEGORY_SKUS = {
        "skus" => [
          {
            "id" => 3407669,
            "ean" => "",
            "pn" => "",
            "first_product_shop_info" => nil,
            "click_url" => "http://www.skroutz.gr/products/show/12718505",
            "price_max" => nil,
            "price_min" => nil,
            "reviewscore" => 0,
            "shop_count" => 0,
            "plain_spec_summary" => "Τύπος: Ξαπλώστρες Κήπου & Βεράντας",
            "active_products_count" => 0,
            "main_picture" => {
              "small_url" => "http://b.scdn.gr/images/sku_main_images/003407/3407669/small_12718505-orig.jpg",
              "original_url" => "http://c.scdn.gr/images/sku_main_images/003407/3407669/medium_12718505-orig.jpg",
              "tiny_url" => "http://a.scdn.gr/images/sku_main_images/003407/3407669/tiny_12718505-orig.jpg",
              "medium_url" => "http://c.scdn.gr/images/sku_main_images/003407/3407669/medium_12718505-orig.jpg"
            }
          }
        ]
      }

      SHOPS_LETTER = {
        "shops" => [
          {
            "id" => 1080,
            "name" => "A-anastasiadisbros",
            "phone" => "2104943444",
            "image_url" => "http://d.scdn.gr/assets/merchants/el/no_logo.png",
            "thumbshot_url" => "http://b.scdn.gr/images/shops/screens/1080.png"
          },
          {
            "id" => 990,
            "name" => "A1shop",
            "phone" => "2310700504",
            "image_url" => "http://d.scdn.gr/assets/merchants/el/no_logo.png",
            "thumbshot_url" => "http://c.scdn.gr/images/shops/screens/990.png"
          }
        ]
      }

      SINGLE_MANUFACTURER = {
        "manufacturer " => {
          "id " => 12907,
          "name " => "Rapala",
          "image_url " => nil
        }
      }
    end
  end
end

include Skroutz::Resources::Helpers
