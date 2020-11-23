class FullfilledOrderSerializer < ActiveModel::Serializer
  attributes :id, :order_date, :order_details, :status, :price, :fullfilled_at

  def order_date
    object.order_date.strftime("%d/%m/%Y %H:%M:%S") if object.order_date.present?
  end

  def order_details
    order_summary = object.order_details.group_by { |order_detail| order_detail.fullfilled ? :fullfilled : :rejected }
    order_summary[:rejected] = [] if order_summary[:rejected].blank?
    order_summary[:fullfilled] = [] if order_summary[:fullfilled].blank?
    order_summary
  end

  def fullfilled_at
    object.fullfilled_at.strftime("%d/%m/%Y %H:%M:%S") if object.fullfilled_at.present?
  end

end
