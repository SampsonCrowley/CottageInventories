class CreateItemSales < ActiveRecord::Migration[5.0]
  def change
    create_table :item_sales do |t|
      t.references :item, foreign_key: true
      t.references :sale, foreign_key: true
      t.integer :used

      t.timestamps
    end
  end
end
