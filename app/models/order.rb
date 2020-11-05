class Order < ApplicationRecord
  has_many :order_details

  before_create :set_date
  accepts_nested_attributes_for :order_details

  def set_date
    self.order_date = DateTime.now
  end
end
