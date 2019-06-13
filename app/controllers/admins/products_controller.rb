class Admins::ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])
    @genre = product.genre
    @label = product.label
    @artist = product.artist
  end

  def new
  	@product = Product.new
<<<<<<< HEAD
  	@disc = @product.discs.build
  	@song = @disc.songs.build
=======
    # disc = @product.discs.build
    # disc.songs.build
    @disc = @product.discs.build
    @song = @disc.songs.build
>>>>>>> master
  end

  def create
  	@product = Product.new(product_params)
  	@product.save!
<<<<<<< HEAD
  	redirect_to admins_product_path(@product)
=======
    redirect_to admins_product_path(@product)
  end

  def destroy
>>>>>>> master
  end

  def index
  end

  def edit
  end

  private

<<<<<<< HEAD
  def product_params
  	params.require(:product).permit(:album_name, discs_attributes: [:id, :product_id, :disc_number, :_destroy,
  		                                         songs_attributes: [:id, :disc_id, :name, :track, :_destroy]])
  end
=======
  	def product_params
  		params.require(:product).permit(
        :profile_image,:album_name,:price,:stock,:status,discs_attributes:[:id,:disc_number,songs_attributes:[:id,:name]])
  	end
>>>>>>> master

end
