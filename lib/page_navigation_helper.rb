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

    html = "<a class='nav-link #{active_child_link(page_url)}' "
    html << "href='#{page_url}'>"
    html << t("docs.#{doc_key}.#{page.title}",
              flavor: settings.site_name.capitalize)
    html << "</a>"

    html
  end
end
