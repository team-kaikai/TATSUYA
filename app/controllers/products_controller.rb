class ProductsController < ApplicationController
  def index
  end

  def show
  	@product = Product.find(params[:id])
    #@genre = product.genre
    #@label = product.label
    #@artist = product.artis
    #@disc = product.disc.songs
    #@products = Product.all.order(created_at: :desc)
  end

end
