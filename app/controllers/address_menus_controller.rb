class AddressMenusController < ApplicationController
  def create
  end

  def new
  	@address_menu = AddressMenu.new
  end

  def destroy
  end
end

