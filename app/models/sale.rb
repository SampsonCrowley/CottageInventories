class Sale < ReadOnlyRecord
  has_many :item_sales, inverse_of: :sale
  has_many :items, through: :item_sales

  accepts_nested_attributes_for :item_sales

  validates_presence_of :name, :description
  validates :total, numericality: { greater_than: 0 }
  validates_associated :item_sales
end
