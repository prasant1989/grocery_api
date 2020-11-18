class AddPriceToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :price, :float
    add_column :orders, :fullfilled_at, :datetime
  end
end
