class CommentsController < ApplicationController
  def create
  	product = Product.find(params[:product_id])
    comment = current_end_user.comments.new(comment_params)
    comment.product_id = product.id
    comment.save!
    redirect_to product_path(current_end_user.id)
  end

  def destroy
  	comment = Comment.find(params[:id])
    if comment.destroy
       flash[:notice] = "削除しました"
       redirect_to product_path(current_end_user.id)
    end
  end

    private

  def comment_params
  	params.require(:comment).permit(:enduser_id,:product_id,:comment)
  end

end
