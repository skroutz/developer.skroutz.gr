module DocumentHelper
  def flavored?(doc)
    doc.flavors.blank? || (doc.flavors.present? && doc.flavors.include?(flavor))
  end
end
