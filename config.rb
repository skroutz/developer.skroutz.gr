require 'lib/code_example_helper'
require 'lib/response_mate_helper'

###########################
# Layouts
###########################
page 'index.html', layout: false

###########################
# SideBars
###########################
page 'analytics/*', sidebar: 'partials/sidebars/analytics'
page 'api/v2/*', sidebar: 'partials/sidebars/api/v2'
page 'api/v3/*', sidebar: 'partials/sidebars/api/v3'
page 'authentication/*', sidebar: 'partials/sidebars/authentication'
page 'guides/*', sidebar: 'partials/sidebars/guides'
page 'help/*', sidebar: 'partials/sidebars/help'
page 'oauthdoc/*', sidebar: 'partials/sidebars/oauthdoc'

###########################
# Pretty URLs
###########################
activate :directory_indexes

###########################
# Relative URLs
###########################
set :relative_links, true

###########################
# Syntax Highlight
###########################
activate :syntax, line_numbers: false

###########################
# MarkDown
###########################
set :markdown_engine, :kramdown
set :markdown, layout_engine: :erb, toc_levels: '2'

###########################
# Assets
###########################
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

###########################
# Build Configuration
###########################
configure :build do
end

###########################
# Helpers
###########################
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

  # Shorthand for data[flavor]
  #
  # @return [String] Data of the current flavor
  def flavor_data
    data[flavor]
  end
end

###########################
# Initializers
###########################

# Set API responses output directory per flavor
ResponseMate.setup do |config|
  config.output_dir = "./resources/responses/#{flavor}"
end
