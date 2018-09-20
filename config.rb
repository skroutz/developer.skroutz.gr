require 'lib/code_example_helper'
require 'lib/document_helper'
require 'lib/page_navigation_helper'
require 'lib/response_mate_helper'
require 'uglifier'

# Layouts
page 'index.html', layout: false
page '404.html', layout: false



# Pretty URLs
activate :directory_indexes

# Relative URLs
set :relative_links, true


# Syntax Highlight
activate :syntax, line_numbers: false

configure :development do
  activate :livereload
  set :debug_assets, true
  set :site_url, ""
end

# MarkDown
set :markdown_engine, :kramdown
set :markdown, layout_engine: :erb, toc_levels: [2, 3]

# Assets
set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'
set :fonts_dir, 'assets/fonts'

# Build Configuration
configure :build do

  # Use Relative Assets
  activate :relative_assets

  # Enable Cache Buster     Cache Method #02
  activate :asset_hash

  # Minify CSS
  activate :minify_css

  # Minify JS
  activate :minify_javascript, compressor: Uglifier.new

  # GZip
  activate :gzip

  set :site_url, "/skroutz/internal_docs"
end

# Helpers
helpers CodeExampleHelper
helpers ResponseMateHelper
helpers PageNavigationHelper
helpers DocumentHelper

helpers do
  # @return [String] Data of the current flavor
  def settings
    data.info
  end

  # Returns the default Page title of the site
  #
  # @return [String] the default Page title
  def site_title
    "Api Internal Documentation"
  end

  # Builds the Page title of the current page
  #
  # Parameters can be either keys that point at the locale or literals. The
  # translation lookup scope for keys is within [:titles, :docs].
  #
  # @param [Hash] page the page to build title for
  # @return [String] the constructed Page title
  def page_title(page)
    return site_title if page.title.nil? || page.title.empty?

    title = "#{page.title.to_s.titleize}"

    if page.parent.nil?
      parent_title = site_title
    else
      parent_title = "#{page.parent}"
    end

    "#{title} | #{parent_title}"
  end
end

# Initializers

# Set API responses output directory
ResponseMate.setup do |config|
  config.output_dir = "./resources/responses"
end

activate :deploy do |deploy|
  deploy.method = :git
  deploy.branch = 'master'
  deploy.build_before = true
end
