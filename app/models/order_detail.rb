class OrderDetail < ApplicationRecord
  belongs_to :catalog, optional: true
  belongs_to :order

  before_validation(on: :create) do
    self.unit = unit.upcase if attribute_present?("unit")
  end

  validates :unit , presence: true, inclusion: { in: UNIT_TYPES}
  validates :item_name , presence: true
  validates :price, presence: true
  validates :quantity, presence: true


  def fullfill_order_item
    update_attributes(fullfilled: 1)
  end
end
