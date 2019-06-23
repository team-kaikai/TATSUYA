class Inquiry < ApplicationRecord

  # attr_accessor :name, :email, :message
#mail用
  validates :name, :presence => {:message => '名前を入力してください'}
  validates :email, :presence => {:message => 'メールアドレスを入力してください'}
end
