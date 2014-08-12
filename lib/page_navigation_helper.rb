module PageNavigationHelper
  # Constructs the relative url of a given inner Doc page
  #
  # @param [String] doc_base_url the base url of the Doc
  # @param [Hash] page the Doc page data
  # @return [String] the relative url to the Doc page
  def url_to_doc_page(doc_base_url, page)
    if page.url.nil?
      "#{doc_base_url}#{page.title}/"
    else
      page.url
    end
  end

  # Checks if a given Doc is deprecated
  #
  # @param [Hash] doc the Doc to check
  # @return [Boolean] true for deprecated Doc, otherwise false
  def deprecated?(doc)
    doc.deprecated == true
  end

  # Returns proper CSS classes if given Doc is the currently visited
  #
  # @param [String] doc the Doc to check if is active
  # @return [String] the active CSS classes
  def active_parent_link(doc)
    'active in' if current_page.url =~ /#{Regexp.quote(doc[:base])}/
  end

  # Returns proper CSS classes if given Page Doc is the currently visited
  #
  # @param [String] doc_page_url the Doc page url to check if is active
  # @return [String] the active CSS classes
  def active_child_link(doc_page_url)
    'active' if doc_page_url == current_page.url
  end

  # Builds a Doc parent link for Sidebar
  #
  # @param [String] key the docs key in data/docs.yml
  # @param [Hash] doc the doc data
  # @return [String] the html anchor element
  def sidebar_parent_link(key, doc)
    html = "<a class='collapse-btn #{active_parent_link(doc)}' "
    html << "data-toggle='collapse' data-parent='.nav-sidebar' "
    html << "href='#nav-sidebar-#{key}'>"
    html << t("titles.#{key}",
              flavor: settings.site_name.capitalize)
    html << "<span class='label label-default pull-right'>#{t('deprecated')}</span>" if deprecated?(doc)
    html << "</a>"

    html
  end

  # Builds a Doc child page link for Sidebar
  #
  # @param [String] doc_key the docs key in data/docs.yml
  # @param [Hash] doc the doc data
  # @param [Hash] page the doc page data
  # @return [String] the html anchor element
  def sidebar_child_link(doc_key, doc, page)
    page_url = url_to_doc_page(doc.base, page)

    html = "<a class='navbar-link #{active_child_link(page_url)}' "
    html << "href='#{page_url}'>"
    html << t("docs.#{doc_key}.#{page.title}",
              flavor: settings.site_name.capitalize)
    html << "</a>"

    html
  end

  # Builds a set of <span> elements for a given list of items.
  #
  # @param [Array] items the array of items
  # @param [String] classes the CSS classes to style the list
  # @return [String] the constructed <span> elements
  def bs_text(items, classes)
    html = "<span class='#{classes}'>"

    items.each do |item|
      html << '<span'
      html << ' class="active"' if item[:active]
      html << '>'
      html << item[:html]
      html << '</span>'
    end

    html << '</span>'
    html
  end

  # Builds a Bootstrap List component for a given list of items.
  #
  # @param [Array] list_items the array of items
  # @param [String] list_classes the CSS classes to style the list
  # @return [String] the constructed <ul/> element
  def bs_list(list_items, list_classes)
    html = "<ul class='#{list_classes}'>"

    list_items.each do |list_item|
      html << '<li'
      html << ' class="active"' if list_item[:active]
      html << '>'
      html << list_item[:html]
      html << '</li>'
    end

    html << '</ul>'
    html
  end

  # Builds a Bootstrap Dropdown component for a given list of items.
  #
  # @param [Array] list_items the array of items
  # @param [String] list_classes the CSS classes to style the list
  # @param [String] dropdown_classes the CSS classes to style the dropdown
  # @param [String] toggle the dropdown toggle content
  # @return [String] the constructed <ul/> element
  def bs_dropdown(list_items, list_classes, dropdown_classes, toggle)
    html = "<ul class='nav navbar-nav #{list_classes}'>"
    html << "<li class='dropdown #{dropdown_classes}'>"
    html << '<a class="dropdown-toggle" data-toggle="dropdown" href="#">'
    html << toggle
    html << '</a>'
    html << '<ul class="dropdown-menu" role="menu">'

    list_items.each do |list_item|
      html << '<li'
      html << ' class="active"' if list_item[:active]
      html << '>'
      html << list_item[:html]
      html << '</li>'
    end

    html << '</ul></li></ul>'
    html
  end

  # Builds an array of hashes with the available locales for a given page.
  #
  # @param [Hash] page the page to build the array for
  # @return [Array] the array list
  def locale_links(page)
    return [] if page.data.locale.nil?

    list_items = Array.new

    page.data.locale[flavor].each do |lang|
      active = (lang == I18n.locale.to_s)

      if lang == I18n.default_locale.to_s
        if lang == I18n.locale.to_s
          url = page.url
        else
          url = page.url.gsub("/#{I18n.locale}/", '/')
        end
      else
        if I18n.locale == I18n.default_locale
          url = "/#{lang}#{page.url}"
        else
          url = page.url.gsub("/#{I18n.locale}/", "/#{lang}/")
        end
      end

      html = "<a class='nav-link' href='#{url}'>"
      html << "<span class='lang-code'>#{lang}</span>"
      html << "<span class='lang-name'>#{t('lang.'+lang)}</span>"
      html << '</a>'

      list_items << { html: html, active: active }
    end

    list_items
  end
end
