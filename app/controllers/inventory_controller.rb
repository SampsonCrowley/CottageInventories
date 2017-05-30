class InventoryController < ApplicationController
  def show
    @used_items = Item.where("used >= quantity").order(:category_id, :name, :cost)
    @available_items = Item.where("quantity > used").order(:category_id, :name, :cost)
  end
end
