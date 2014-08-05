module DocumentHelper
  # Checks if a given Doc is deprecated
  #
  # @param [Hash] doc the Doc to check
  # @return [Boolean] true for deprecated Doc, otherwise false
  def deprecated?(doc)
    doc.deprecated == true
  end

  def featured?(doc)
    doc.featured == true
  end

  def flavored?(doc)
    doc.flavors.blank? || (doc.flavors.present? && doc.flavors.include?(flavor))
  end

  def featured
    data.docs.select do |_, doc|
      featured?(doc) && !deprecated?(doc) && flavored?(doc)
    end
  end

  def featured_offset(size)
    sm = size > 3 ? 0 : 3 - size
    md = size > 6 ? 0 : 6 - size

    "col-sm-offset-#{sm} col-md-offset-#{md}"
  end
end
