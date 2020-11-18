class CreateOrderDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :order_details do |t|
      t.string :item_name
      t.float :price, default: 0.0
      t.references :catalog,  foreign_key: true
      t.float :quantity, default: 0
      t.string :unit
      t.references :order,{ null: false, foreign_key: true }
      t.boolean :fullfilled, default: 0
      t.text :notes

      t.timestamps
    end
  end
end
