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
  	@product = Product.new(params_int(product_params))
  	 if @product.save
        flash[:notice] = "追加しました"
        redirect_to admins_product_path(@product)
     else
        render :new
     end
  end

  def destroy
    @product = Product.find(params[:id])
     if @product.destroy
        flash[:notice] = "削除しました"
        redirect_to admins_products_path
     end
  end

  def index
    @products = Product.all.order(created_at: :desc)

     # 検索オブジェクト
     @search = Product.ransack(params[:q])

    if params[:q]
    # 検索結果
     @products = @search.result
    #ランキング実装用
    end


    @all_ranks = Product.find(Favorite.group(:product_id).order('count(product_id)desc').limit(5).pluck(:product_id))
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
       flash[:notice] = "更新しました"
       redirect_to admins_products_path
    else
       render :edit
    end
  end

  # 文字列が数字だけで構成されていれば true を返す
  def number?(str)
    # 文字列の先頭(\A)から末尾(\z)までが「0」から「9」の文字か
    nil != (str =~ /\A[0-9]+\z/)
  end

  private
	def product_params
		params.require(:product).permit(:artist_id,:label_id,:genre_id,:profile_image,:album_name,:price,:stock,:status,:body,
      :discs_attributes=> [:id, :product_id, :disc_number, :_destroy,
        :songs_attributes=> [:id, :disc_id, :name, :track, :_destroy]])
	end
# ーーーーenum記述ーーーーーーーーー
  def params_int(product_params)
    product_params.each do |key,value|
       if number?(value)
        product_params[key]=value.to_i
       end
    end
  end
end

