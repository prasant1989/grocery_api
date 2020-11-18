class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy,:reject, :fullfill]

  # GET /orders
  def index
    @orders = Order.pending_orders

    render json: @orders
  end

  # GET /orders/1
  def show
    render json: @order
  end

  # POST /orders
  def create
    @order = Order.new(order_params)

    if @order.save
      render json: @order, status: :created, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
  end

  #Pending Orders
  def pending
    render json: Order.pending_orders
  end

  #Fullfilled Orders
  def fullfilled
    render json: Order.fullfilled_orders, each_serializer: FullfilledOrderSerializer
  end

  #cancelled Orders
  def cancelled
    render json: Order.cancelled_orders
  end

  #POST Order fullfillment
  def fullfill
    order_details = @order.order_details
    params[:order].each do |order_to_fullfill|
      if(order_to_fullfill[:checked] == 1)
        order_detail = OrderDetail.find_by(id: order_to_fullfill[:id])
        if order_detail.present?
          order_detail.fullfill_order_item
        else
          @order.order_details.create( params[:order].last.permit!.merge(fullfilled:1).except(:checked))
        end
      end
    end
    @order.update_attributes(price: params[:totalPrice], status: 1, fullfilled_at: DateTime.now)
    # @order = Order.find(params[:id])
    # render json: Order
    render json: @order
  end

  #POST Order Rejection
  def reject
    order = @order.cancelled!
    render json: order
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_params
      params.require(:order).permit(:order_date,:status,order_details_attributes: [:item_name, :catalog_id, :price, :quantity,:notes,:unit,:fulfilled])
    end
end
