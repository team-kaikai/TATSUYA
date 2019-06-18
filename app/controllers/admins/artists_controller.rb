class Admins::ArtistsController < ApplicationController
  def create
  	@artist =Artist.new(artist_params)
  	@artist.save
    redirect_to home_select_path
  end
  def new
  	@artist = Artist.new
  	@genre = Genre.new
  	@label = Label.new
  end

  private
  def artist_params
  	params.require(:artist).permit(:name)
  end
end
