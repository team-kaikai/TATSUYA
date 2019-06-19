class Admins::OrderAppendsController < ApplicationController
  def show
  end

  def index
  	@order_appends = OrderAppend.all

  end
end
