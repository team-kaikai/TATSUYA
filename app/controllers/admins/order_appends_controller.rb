class Admins::OrderAppendsController < ApplicationController
  def show
  	@order_append = OrderAppend.find(params[:id])
  	@order_details = OrderDetail.all
  end

  def index
  	@order_appends = OrderAppend.all
  	# @enduser = EndUser.find(enduser_id)
  	@order_details = OrderDetail.all
    # @order_detail = order_appends.order_detailss
  end

  def update
  	@order_append = OrderAppend.find(params[:id])
  	@order_append.update(order_append_params)
  	#redirect_to admins_order_append_path(@order_append.id)
  	redirect_to  admins_order_appends_path
  end

  private
  	def order_append_params
  		params.require(:order_append).permit(:status)
  	end
end
