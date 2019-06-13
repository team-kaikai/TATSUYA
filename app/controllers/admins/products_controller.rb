class Admins::ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])
    @genre = product.genre
    @label = product.label
    @artist = product.artist
  end

  def new
  	@product = Product.new
    # disc = @product.discs.build
    # disc.songs.build
    @disc = @product.discs.build
    @song = @disc.songs.build
  end

  def create
  	@product = Product.new(product_params)
  	@product.save!
    redirect_to admins_product_path(@product)
  end

  def destroy
  end

  def index
  end

  def edit
  end

  private


  def product_params
  	params.require(:product).permit(:album_name, :profile_image, :price, :stock, :status, discs_attributes: [:id, :product_id, :disc_number, :_destroy,
  		                                         songs_attributes: [:id, :disc_id, :name, :track, :_destroy]])
  end

end
