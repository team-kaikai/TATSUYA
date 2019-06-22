class Admins::OrderAppendsController < ApplicationController
  def show
  	@order_append = OrderAppend.find(params[:id])
  	@order_details = OrderDetail.all
  end

  def index
  	@order_appends = OrderAppend.all
  end

  def update
  	@order_append = OrderAppend.find(params[:id])
  	@order_append.update(order_append_params)
  	redirect_to admins_order_append_path(@order_append.id)
  end

  private
  	def order_append_params
  		params.require(:order_append).permit(:status)
  	end
end
