class Admins::GenresController < ApplicationController
  def create
  	@genre = Genre.new(genre_params)
  	if @genre.save
       flash[:notice] = "You have creatad genre successfully."
       redirect_to home_select_path
    else
      render :new
    end

  end
  def new
  end

  private
  	def genre_params
  		params.require(:genre).permit(:name)
  	end
end
