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
    # admin側の一覧画面で情報を持ってくる為のflag
    @inquiry.mail_flag = 1
      @inquiry.save
    InquiryMailer.received_email(@inquiry).deliver
    # 完了画面を表示
    render :action => 'thanks'

	end


  def admin_index
    #mail_flag:1の情報を持ってくる
  	@inquiry = Inquiry.where(mail_flag: 1)
  end

  def admin_show
  	@inquiries = Inquiry.find(params[:id])
  	@inquiry = Inquiry.new
  end

  def admin_thanks
    # メール送信
    @inquiry = Inquiry.new(inquiry_params)
      @inquiry.save
    InquiryMailer.reply_email(@inquiry).deliver
    render :action => 'admin_thanks'
  end


  private

  def inquiry_params
  	params.require(:inquiry).permit(:name, :email, :message )
  end

end
