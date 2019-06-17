class OrderAppendsController < ApplicationController

  def new
  	@order_append = OrderAppend.new
  end

  def create
  	@order_append = OrderAppend.new(order_append_params)
  end

   def order_append_params
    params.permit(:name, :address, :postal_code)
  end


end
