class ProductsController < ApplicationController
  def index
  	@products = Product.all
    # 検索オブジェクト
    @search = Product.ransack(params[:q])
    # 検索結果
    @products = @search.result
  	#ランキング実装用？
  	#@all_ranks = Products.find(Like.group(:product_id).order('count(product_id)desc').limit(5).pluck(:product_id))
  end

  def show
  	@product = Product.find(params[:id])
  	@label = @product.label
  	@genre = @product.genre
    @artist = @product.artist
    # @disc = @product.disc
    @cart = Cart.new
    @comment = Comment.new
  end

  def create
  end


end
