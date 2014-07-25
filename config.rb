require 'lib/code_example_helper'
require 'lib/page_navigation_helper'
require 'lib/response_mate_helper'

###########################
# Layouts
###########################
page 'index.html', layout: false

###########################
# Localization
###########################
activate :i18n, langs: [:en]
I18n.enforce_available_locales = false  # Silence I18n deprecation warnings

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
set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'
set :fonts_dir, 'assets/fonts'

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
helpers PageNavigationHelper

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
                default: ["docs.#{page.parent}.#{page.title}".to_sym,
                          page.title.to_s.titleize])

    if page.parent.nil?
      parent_title = site_title
    else
      parent_title = t("titles.#{page.parent}", default: site_title)
    end

    "#{title} | #{parent_title}"
  end
end

###########################
# Initializers
###########################

# Set API responses output directory per flavor
ResponseMate.setup do |config|
  config.output_dir = "./resources/responses/#{flavor}"
end
