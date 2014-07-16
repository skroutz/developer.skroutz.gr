require 'lib/code_example_helper'
require 'lib/response_mate_helper'

page 'index.html', layout: false

page 'help/*', sidebar: 'partials/sidebars/help'
page 'api/v2/*', sidebar: 'partials/sidebars/api/v2'
page 'api/v3/*', sidebar: 'partials/sidebars/api/v3'
page 'guides/*', sidebar: 'partials/sidebars/guides'
page 'authentication/*', sidebar: 'partials/sidebars/authentication'
page 'analytics/*', sidebar: 'partials/sidebars/analytics'
page 'oauthdoc/*', sidebar: 'partials/sidebars/oauthdoc'

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }
activate :directory_indexes
set :relative_links, true

# Syntax Highlight
activate :syntax, line_numbers: false

###
# Helpers
###
helpers CodeExampleHelper
helpers ResponseMateHelper

helpers do

  # Returns the current environment flavor
  #
  # @example Run Middleman for Skroutz
  #   FLAVOR=skroutz bundle exec middleman server
  #   flavor #=> 'skroutz'
  #
  # @example Build website for Alve
  #   FLAVOR=alve bundle exec middleman build
  #   flavor #=> 'alve'
  #
  # @return [String] the current flavor
  def flavor
    @flavor ||= ENV['FLAVOR'] || 'skroutz'
  end

end

set :markdown, layout_engine: :erb, toc_levels: '2'

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
end
