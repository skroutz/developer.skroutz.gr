module ViewHelper
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

  # Returns proper CSS classes if given parent page URL is the currently visited
  #
  # @param [String] url the URL to check if is active
  # @return [String] the active CSS classes
  def active_parent_classes(url)
    'active in' if current_page.url =~ /#{Regexp.quote(url)}/
  end

  # Returns proper CSS classes if given child page URL is the currently visited
  #
  # @param [String] url the URL to check if is active
  # @return [String] the active CSS classes
  def active_child_classes(url)
    'active' if url == current_page.url
  end

  # Builds a collapsible menu for the sidebar
  #
  # @param [Hash] page the page section to build menu for
  # @return [String] the constructed menu
  def render_sidebar_menu(page)
    html = ''

    title = t(page[:title], flavor: settings.site_name.capitalize)

    # Parent
    html << "<a class='collapse-btn #{active_parent_classes(page[:base])}'"
    html << ' data-toggle="collapse" data-parent=".nav-sidebar"'
    html << " href='#nav-menu-#{title.downcase.gsub(' ', '-')}'>"
    html << title

    if deprecated?(page)
      html << '<span class="label label-default pull-right">'
      html << "#{t('common.deprecated')}</span>"
    end

    html << '</a>'

    # Submenu wrapper
    html << "<div id='nav-menu-#{title.downcase.gsub(' ', '-')}'"
    html << " class='collapse nav-menu-sidebar #{active_parent_classes(page[:base])}'>"

    # Submenu
    Array(page[:pages]).each do |p|
      url = p[:url] || "#{page[:base] }#{p[:title]}/"
      html << "<a class='navbar-link #{active_child_classes(url)}'"
      html << " href='#{url}'>"
      html << t("#{page[:titles]}.#{ p[:title]}")
      html << '</a>'
    end

    html << '</div>'
    html
  end

  # Returns a link to edit source on GitHub repo
  #
  # @return [String] the html anchor element
  def render_edit_link
    url = current_page.source_file.sub(/^(.*)\/source/,
      "#{settings.github_profile}/developer.skroutz.gr/blob/master/source")

    link_to "<span>#{t('common.edit_on_github')}</span>", url,
      title: t('common.edit_on_github'), class: 'btn-edit-github'
  end

  # Builds a set of <span> elements for a given list of items.
  #
  # @param [Array] items the array of items
  # @param [String] classes the CSS classes to style the list
  # @return [String] the constructed <span> elements
  def render_inline(items, classes)
    html = "<span class='#{classes}'>"

    Array(items).each do |item|
      next if !item[:skip].nil? && item[:skip]

      html << '<span class="item'
      html << ' active' if item[:active]
      html << '">'
      html << item[:html]
      html << '</span>'
    end

    html << '</span>'
    html
  end

  # Builds a List component for a given list of items.
  #
  # @param [Array] list_items the array of items
  # @param [String] classes the CSS classes to style the list
  # @return [String] the constructed <ul/> element
  def render_list(list_items, classes)
    html = "<ul class='#{classes}'>"

    Array(list_items).each do |list_item|
      html << '<li'
      html << ' class="active"' if list_item[:active]
      html << '>'
      html << list_item[:html]
      html << '</li>'
    end

    html << '</ul>'
    html
  end

  # Builds a Dropdown component for a given list of items.
  #
  # @param [Array] list_items the array of items
  # @param [String] list_classes the CSS classes to style the list
  # @param [String] dropdown_classes the CSS classes to style the dropdown
  # @param [String] toggle the dropdown toggle content
  # @return [String] the constructed <ul/> element
  def render_dropdown(list_items, list_classes, dropdown_classes, toggle)
    html = "<ul class='nav navbar-nav #{list_classes}'>"
    html << "<li class='dropdown #{dropdown_classes}'>"
    html << '<a class="dropdown-toggle" data-toggle="dropdown" href="#">'
    html << toggle
    html << '</a>'
    html << '<ul class="dropdown-menu" role="menu">'

    Array(list_items).each do |list_item|
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
  def available_locales(page = current_page)
    return [] unless localized?(page)

    locales = []

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

      locales << { lang: lang, url: url, active: active, skip: active, html: html }
    end

    locales
  end
end
