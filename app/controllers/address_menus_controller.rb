class AddressMenusController < ApplicationController
  def create
  	 @address_menus = AddressMenu.new(address_menu_params)
  	 @address_menus.enduser_id = current_end_user.id
  	 @address_menus.save!
  	 redirect_to new_end_user_address_menus_path(current_end_user.id)
  end

  def new
  	@enduser = EndUser.find(params[:end_user_id])
 	  @address_menus = AddressMenu.new
  end

  def destroy
  	address_menu = AddressMenu.find(params[:end_user_id])
    address_menu.destroy
    redirect_to new_end_user_address_menus_path(current_end_user.id)
  end

 private
    def address_menu_params
        params.require(:address_menu).permit(:name, :postal_code, :address)
    end
end

