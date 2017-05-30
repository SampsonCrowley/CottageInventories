class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.references :receipt, foreign_key: true, null: false
      t.references :category, foreign_key: true, null: false
      t.references :sale, foreign_key: true
      t.string :name, null: false
      t.text :description
      t.integer :quantity, null: false, default: 1
      t.float :cost, null: false
      t.string :measurement, null: false, default: 'i'
      t.integer :used, default: 0
    end
  end
end
