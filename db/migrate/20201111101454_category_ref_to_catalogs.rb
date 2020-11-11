class CategoryRefToCatalogs < ActiveRecord::Migration[6.0]
  def change
    add_reference :catalogs, :category, foreign_key: true
  end
end
