require 'lib/code_example_helper'
require 'lib/document_helper'
require 'lib/page_navigation_helper'
require 'lib/response_mate_helper'
require 'lib/flavor_helper'
require 'uglifier'

# Layouts
page 'index.html', layout: false
page '404.html', layout: false


# Localization
activate :i18n, langs: [:en, :el, :tr]
I18n.enforce_available_locales = false  # Silence I18n deprecation warnings

# Pretty URLs
activate :directory_indexes

# Syntax Highlight
activate :syntax, line_numbers: false


# MarkDown
set :markdown_engine, :kramdown
set :markdown, layout_engine: :erb, toc_levels: [2, 3]

# Assets
set :css_dir, 'assets/stylesheets'
set :sass_assets_paths, ['source/assets/stylesheets']
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'
set :fonts_dir, 'assets/fonts'

# Build Configuration
configure :build do
  # Ignore assets from other flavors
  %w(skroutz alve scrooge).each do |f|
    next if f == flavor

    ignore "assets/images/#{f}/*"
    ignore "assets/stylesheets/flavors/#{f}.*"
  end

  # Use Relative Assets
  activate :relative_assets

  # Enable Cache Buster     Cache Method #02
  activate :asset_hash

  # Minify CSS
  activate :minify_css

  # Minify JS
  activate :minify_javascript, compressor: Uglifier.new
end

# Helpers
helpers CodeExampleHelper
helpers ResponseMateHelper
helpers PageNavigationHelper
helpers DocumentHelper
helpers FlavorHelper

# make FlavorHelper be available to the config context
include FlavorHelper

helpers do
  # Shorthand for data[flavor]
  #
  # @return [String] Data of the current flavor
  def settings
    data[flavor]
  end

  # Returns the default Page title of the site
  #
  # @return [String] the default Page title
  def site_title
    "#{settings.site_name} #{t('titles.docs')}".titleize
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

    title = t("titles.#{page.title}",
              flavor: settings.site_name.capitalize,
              default: ["docs.#{page.parent}.#{page.title}".to_sym,
                        page.title.to_s.titleize])

    if page.parent.nil?
      parent_title = site_title
    else
      parent_title = t("titles.#{page.parent}",
                       flavor: settings.site_name.capitalize,
                       default: site_title)
    end

    "#{title} | #{parent_title}"
  end
end

# Initializers

# Set API responses output directory per flavor
ResponseMate.setup do |config|
  config.output_dir = "./resources/responses/#{flavor}"
end
