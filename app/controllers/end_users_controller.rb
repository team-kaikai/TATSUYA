class EndUsersController < ApplicationController
  def show
    @enduser = EndUser.find(params[:id])
  end

  def edit
    @enduser = EndUser.find(params[:id])
  end

  def update
  end

  def destroy
  end

  def index
  end

  private
    def address_params
      params.require(:postal_code).permit(:first_postal_code,:last_postal_code)
    end

end
