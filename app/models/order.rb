class Order < ApplicationRecord
  enum status: { pending: 0, fullfilled: 1, cancelled: 2 }
  has_many :order_details, dependent: :delete_all

  before_create :set_date
  accepts_nested_attributes_for :order_details

  scope :pending_orders, -> { where(status: :pending).order(updated_at: :desc) }
  scope :fullfilled_orders, -> { where(status: :fullfilled).order(updated_at: :desc) }
  scope :cancelled_orders, -> { where(status: :cancelled).order(updated_at: :desc) }

  def set_date
    self.order_date = DateTime.now
  end
end
