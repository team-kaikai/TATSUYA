class AddressMenusController < ApplicationController
  def create
  	 @address_menus = AddressMenu.new(address_menu_params)
  	 @address_menus.save!
  	 
  end

  def new
  	@enduser = EndUser.find(params[:end_user_id])
 	@address_menu = AddressMenu.new
  end

  def destroy
  end

 private
    def address_menu_params
        params.require(:address_menu).permit(:name, :postal_code, :address)
    end
end

