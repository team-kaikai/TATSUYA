class Admins::EndUsersController < ApplicationController


  #Endusersユーザー一覧(/admins/end_users_path)
	def index
		#end_user全員情報
    	@end_users = EndUser.all
    	#検索機能
    	#@search = EndUser.ransack(params[:q])
    	#@result = @search.result
	end

	def show
	    @enduser = EndUser.find(params[:id])
	    @enduser_append = @enduser.order_appends
	    #@product = Product.find(params[:id])
	end

	def destroy
		enduser = EndUser.find(params[:id])
		enduser.destroy
		redirect_to admins_end_users_path
	end


	def edit
		@enduser = EndUser.find(params[:id])
	end

end
