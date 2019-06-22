class Admins::OrderAppendsController < ApplicationController
  def show
  end

  def index
  	@order_appends = OrderAppend.all
  	# @enduser = EndUser.find(enduser_id)
  	@order_details = OrderDetail.all
    # @order_detail = order_appends.order_detailss

  end
end
