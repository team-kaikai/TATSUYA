class EndUsersController < ApplicationController
  def show
    @enduser = EndUser.find(params[:id])
    @product = Product.find(params[:id])
  end

  def edit
    @enduser = EndUser.find(params[:id])
  end

  def update
    @enduser = EndUser.find(params[:id])
    if @enduser.update(enduser_params)
      sign_in(@enduser, bypass: true)
      redirect_to end_user_path(current_end_user)
    else
      flash[:edit] = "空白の欄があります。すべての記入欄を埋めてください。"
      render 'edit'
    end
  end

  def destroy
  end

  def index
  end

  private
    def address_params
      params.require(:postal_code).permit(:first_postal_code,:last_postal_code)
    end

    def enduser_params
      params.require(:end_user).permit(:first_name,:last_name,:details_first_name,:details_last_name,:password,:password_confirmation,:email,:first_postal_code,:last_postal_code,:address,:tel)
    end
end
