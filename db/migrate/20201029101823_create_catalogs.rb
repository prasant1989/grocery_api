class CreateCatalogs < ActiveRecord::Migration[6.0]
  def change
    create_table :catalogs do |t|
      t.string :name
      t.string :unit
      t.float :price, default: 0.0, null: false
      t.timestamps
    end
  end
end
