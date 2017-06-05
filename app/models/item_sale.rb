class ItemSale < ApplicationRecord
  belongs_to :item, inverse_of: :item_sales
  belongs_to :sale, inverse_of: :item_sales

  validates_presence_of :item
  validates :used, numericality: { only_integer: true, greater_than: 0 }
  validate :only_available, if: :item

  private
    def only_available
      puts item
      errors.add(:used, "Cannot use more than available inventory") if used > item.available
    end
end
