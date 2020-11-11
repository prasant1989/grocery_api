class Order < ApplicationRecord
  has_many :order_details

  before_create :set_date
  accepts_nested_attributes_for :order_details

  scope :pending_orders, -> { where(status: false).order(updated_at: :desc) }
  scope :fullfilled_orders, -> { where(status: true).order(updated_at: :desc) }
  def set_date
    self.order_date = DateTime.now
  end
end
