module DocumentHelper
  # Checks if a given Doc is deprecated
  #
  # @param [Hash] doc the Doc to check
  # @return [Boolean] true for deprecated Doc, otherwise false
  def deprecated?(doc)
    doc.deprecated == true
  end

  def flavored?(doc)
    doc.flavors.blank? || (doc.flavors.present? && doc.flavors.include?(flavor))
  end
end
