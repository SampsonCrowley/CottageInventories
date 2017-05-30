class CreateSales < ActiveRecord::Migration[5.0]
  def change
    create_table :sales do |t|
      t.string :name, null: false
      t.text :description
      t.float :total, null: false

      t.timestamps
    end
  end
end
