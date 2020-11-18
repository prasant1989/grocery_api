class OrderSerializer < ActiveModel::Serializer
  attributes :id, :order_date, :order_details, :status, :price

  def order_date
    object.order_date.strftime("%d/%m/%Y %H:%M:%S") if object.order_date.present?
  end

  def order_details
    object.order_details
  end

end
