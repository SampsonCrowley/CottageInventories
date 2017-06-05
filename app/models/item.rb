class Item < ApplicationRecord
  belongs_to :receipt
  belongs_to :category
  has_many :item_sales, inverse_of: :item
  has_many :sales, through: :item_sales

  def self.available
    where("used < quantity")
  end

  def available
    quantity - used
  end

  def name_and_measurement
    "#{name}, #{available}#{measurement_text} left"
  end

  def self.measurement_options
    @@measurements ||= {
      i: {
        label: 'Per Item',
        unit: ''
      },
      m: {
        label: 'Per Millimeter',
        unit: 'mm'
      },
      o: {
        label: 'Per Oz',
        unit: 'oz'
      },
      g: {
        label: 'Per Gram',
        unit: 'g'
      }
    }.with_indifferent_access
  end

  def self.measurements_for_select
    measurement_options.map {|k, v| [v[:label], k]}
  end

  def measurement_text
    Item.measurement_options[measurement][:unit]
  end
end
