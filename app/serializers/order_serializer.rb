class OrderSerializer < ActiveModel::Serializer
  attributes :id, :order_date, :order_details, :status

  def order_date
    object.order_date.to_s(:nozone) if object.order_date.present?
  end

  def order_details
    object.order_details
  end

end
