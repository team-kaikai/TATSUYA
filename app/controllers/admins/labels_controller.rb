class Admins::LabelsController < ApplicationController
  def create
  	@label = Label.new(label_params)
  	if @label.save
       flash[:notice] = "追加しました"
       redirect_to home_select_path
    else
      render :new
    end
  end
  def new
  end

  private
  	def label_params
  		params.require(:label).permit(:name)
  	end
end
