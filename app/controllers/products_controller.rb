class ProductsController < ApplicationController
  def index
  	@products = Product.all
  	#ランキング実装用？
  	#@all_ranks = Products.find(Like.group(:product_id).order('count(product_id)desc').limit(5).pluck(:product_id))
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
