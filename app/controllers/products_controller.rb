class ProductsController < ApplicationController
  def index
  	#ランキング実装用？
  	#@all_ranks = Products.find(Like.group(:product_id).order('count(product_id)desc').limit(5).pluck(:product_id))
  end

  def show
  end

end
