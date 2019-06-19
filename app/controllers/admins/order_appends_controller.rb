class Admins::OrderAppendsController < ApplicationController
  def show
  end

  def index
  	@order_appends = OrderAppends.all
  end
end
