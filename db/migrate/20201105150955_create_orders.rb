class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :user_id
      t.datetime :order_date
      t.integer :status, default: 0
      t.float :price, default: 0.0
      t.datetime :fullfilled_at

      t.timestamps
    end
  end
end
