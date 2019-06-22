class OrderDetailsController < ApplicationController
  def show
  	@order_append = OrderAppend.find(params[:id])
  	#if current_end_user == @order_append.enduser_id
  	@order_details = OrderDetail.all
  	#end
  end
end
