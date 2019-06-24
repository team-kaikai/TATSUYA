class Admins::ArtistsController < ApplicationController
  def create
  	@artist =Artist.new(artist_params)
  	if @artist.save
        flash[:notice] = "追加しました"
        redirect_to home_select_path
    else
      render :new
    end
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
