class Admins::ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])
  end

  def new
  	@product = Product.new
    # disc = @product.discs.build
    # disc.songs.build
    @disc = @product.discs.build
    @song = @disc.songs.build
  end

  def create
    binding.pry
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
  		params.require(:product).permit(
        :profile_image,:album_name,:price,:stock,:status,discs_attributes:[:id,:disc_number,songs_attributes:[:id,:name]])
  	end

end
