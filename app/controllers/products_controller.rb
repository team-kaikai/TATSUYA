class ProductsController < ApplicationController
  def index
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

    if @product.stock != 0
      @limit = []
      (1..@product.stock).each do |s|
        add_limit = [s,s]
        @limit.push(add_limit)
      end
    end
  end

end
