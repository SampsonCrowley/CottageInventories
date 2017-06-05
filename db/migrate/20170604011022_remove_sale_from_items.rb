class RemoveSaleFromItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :sale_id, :references
  end
end
