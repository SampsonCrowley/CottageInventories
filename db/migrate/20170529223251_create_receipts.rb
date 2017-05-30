class CreateReceipts < ActiveRecord::Migration[5.0]
  def change
    create_table :receipts do |t|
      t.string :vendor, null: false
      t.text :description
      t.float :tax, null: false
      t.attachment :hardcopy
      t.timestamps
    end
  end
end
