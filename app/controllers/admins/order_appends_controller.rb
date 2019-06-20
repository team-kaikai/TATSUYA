class Admins::OrderAppendsController < ApplicationController
  def show
  end

  def index
  	@order_appends = OrderAppend.all
    @product = Product.all
  end
end
