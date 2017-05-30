class Receipt < ApplicationRecord
  has_attached_file :hardcopy, styles: {
    thumb: ["200x200>", :png]
  }, processors: [:thumbnail]

  validates_attachment_presence :hardcopy
  validates_attachment_content_type :hardcopy, content_type: [
    "image/jpg",
    "image/jpeg",
    "image/png",
    "image/gif",
    "application/pdf"
  ], message: "Sorry! We do not accept the attached file type"

  validates_presence_of :vendor, :description, :tax

  has_many :items, inverse_of: :receipt
  accepts_nested_attributes_for :items, reject_if: :invalid_item

  def invalid_item(values)
    return true if values.any? {|k, v| v.blank?}
    false
  end

  def total
    items.sum(:cost)
  end
end
