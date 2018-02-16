class OrdersController < ApplicationController
  def index
  	@orders = Order.order('created_at DESC').paginate(:page => params[:page], :per_page => 20)
  end

  def new
  	@order = Order.new
    @order.order_line_items.build
  end

  def create
    @order = Order.new(order_params)
    if @order.contains_valid_line_items
      if @order.save
        flash[:success] = "Order Successfully created..."
        redirect_to orders_path
      else
        render :new
      end
    else
      render :new
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_line_items = @order.order_line_items
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "order",
        template: "orders/invoice",
        layout: 'pdf.html'
      end
    end
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, order_line_items_attributes: OrderLineItem.attribute_names.map(&:to_sym).push(:_destroy))
  end
end
