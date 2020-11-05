class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :user_id
      t.datetime :order_date
      t.boolean :status

      t.timestamps
    end
  end
end
