class InquiryController < ApplicationController
  def index
    # 入力画面を表示
    @inquiry = Inquiry.new
    render :action => 'index'
  end

  def confirm
    # 入力値のチェック
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.valid?
      # OK。確認画面を表示
      render :action => 'confirm'
    else
      # NG。入力画面を再表示
      render :action => 'index'
    end
  end

  def thanks
    # メール送信
    @inquiry = Inquiry.new(inquiry_params)
      @inquiry.save
   if end_user_signed_in?
    InquiryMailer.received_email(@inquiry).deliver
    # 完了画面を表示
    render :action => 'thanks'
	else
	InquiryMailer.reply_email(@inquiry).deliver
	render :action => 'thanks'
	end

  end

  def admin_index
  	@inquiry = Inquiry.all
  end

  def admin_show
  	@inquiries = Inquiry.find(params[:id])
  	@inquiry = Inquiry.new
  end


  private

  def inquiry_params
  	params.require(:inquiry).permit(:name, :email, :message )
  end

end
