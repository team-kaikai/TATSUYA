class AddressMenusController < ApplicationController
  def create
  	 @address_menus = AddressMenu.new(address_menu_params)
  	 @address_menus.enduser_id = current_end_user.id
  	 if @address_menus.save
        flash[:notice] = "追加しました"
  	    redirect_to new_end_user_address_menus_path(current_end_user.id)

     else
        @enduser = EndUser.find(params[:end_user_id])
        render :new
     end
  end

  def new
  	@enduser = EndUser.find(params[:end_user_id])
 	  @address_menus = AddressMenu.new
  end

  def destroy
  	address_menu = AddressMenu.find(params[:end_user_id])
    if address_menu.destroy
       flash[:notice] = "削除しました"
       redirect_to new_end_user_address_menus_path(current_end_user.id)
    end
  end

 private
    def address_menu_params
        params.require(:address_menu).permit(:name, :postal_code, :address)
    end
end

