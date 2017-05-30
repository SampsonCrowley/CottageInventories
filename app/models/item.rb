class Item < ApplicationRecord
  belongs_to :receipt
  belongs_to :category
  belongs_to :sale, optional: true
end
