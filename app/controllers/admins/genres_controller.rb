class Admins::GenresController < ApplicationController
  def create
  	@genre = Genre.new(genre_params)
  	@genre.save
    redirect_to home_select_path
  end
  def new
  end

  private
  	def genre_params
  		params.require(:genre).permit(:name)
  	end
end
