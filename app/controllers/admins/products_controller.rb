class Admins::ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])
    # @genre = product.genre
    # @label = product.label
    # @artist = product.artist
  end

  def new
  	@product = Product.new
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
    @products = Product.all
    # 検索オブジェクト
    @search = Product.ransack(params[:q])
    # 検索結果
    @products = @search.result
  end

  def edit
    @product = Product.find(params[:id])
  end

  private
  	def product_params
  		params.require(:product).permit(
        :artist_id,:label_id,:genre_id,:profile_image,:album_name,:price,:stock,:status,discs_attributes: [:id, :product_id, :disc_number, :_destroy,songs_attributes: [:id, :disc_id, :name, :track, :_destroy]])
  	end

end

