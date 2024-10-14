class OrdersController < ApplicationController
  def index
    @order_destination = OrderDestination.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order_destination = OrderDestination.new(order_params)
    if @order_destination.valid?
      @order_destination.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_destination).permit(:post_code, :shipping_from_id, :city, :street, :building_name, :phone_number).merge(user_id: current_user.id)
  end

end
