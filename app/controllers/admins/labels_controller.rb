class Admins::LabelsController < ApplicationController
  def create
  	@label = Label.new(label_params)
  	@label.save
  end
  def new
  end

  private
  	def label_params
  		params.require(:label).permit(:name)
  	end
end
