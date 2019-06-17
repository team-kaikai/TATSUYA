class Admins::OrderAppendsController < ApplicationController
  def show
  end

  def index
  	@order_appends = Order_appends.all
  end
end
