class Admins::EndUsersController < ApplicationController


  #Endusersユーザー一覧(/admins/end_users_path)
	def index
		#end_user全員情報
    	@end_users = EndUser.all
    	@search = EndUser.ransack(params[:q])
    	@result = @search.result
	end

	def edit
	end

end
