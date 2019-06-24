class ProductsController < ApplicationController
  def index
  	@products = Product.all.order(created_at: :desc)
    # 検索オブジェクト
    @search = Product.ransack(params[:q])
    # 検索結果
    @products = @search.result
  	#ランキング実装用
  	@all_ranks = Product.find(Favorite.group(:product_id).order('count(product_id)desc').limit(5).pluck(:product_id))
    #スクロール
    #@products = Product.page(params[:page]).per(9)
  end

  def show
  	@product = Product.find(params[:id])
  	@label = @product.label
  	@genre = @product.genre
    @artist = @product.artist
    @cart = Cart.new

    if @product.stock != 0
      @limit = []
      (1..@product.stock).each do |s|
        add_limit = [s,s]
        @limit.push(add_limit)
      end
    end
    @comment = Comment.new
    if @product.status == 1.to_i
      rdirect_to products_path
    end
  end

  def create
  end


end
