class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :carts, dependent: :destroy,class_name: "Cart",foreign_key: "enduser_id"
  has_many :products, through: :carts
  has_many :address_menus, dependent: :destroy,class_name: "AddressMenu",foreign_key: "enduser_id"
  has_many :order_appends, dependent: :destroy,class_name: "OrderAppend",foreign_key: "enduser_id"
  has_many :favorites, dependent: :destroy,class_name: "Favorite",foreign_key: "enduser_id"
  has_many :comments, dependent: :destroy,class_name: "Comment",foreign_key: "enduser_id"

  acts_as_paranoid
  # def end_user
  #   EndUser.unscoped{super}
  # end

   # attr_writer :first_postal_code, :last_postal_code

   #validates :postal_code,format: {with: /\A\d{7}\z/}
   # validates :first_postal_code, presence: true
   # validates :last_postal_code, presence: true
   validates :first_name,presence: true
   validates :last_name,presence: true
   validates :address,length:{ in: 10..20}
   validates :tel,length: {in: 10..13}


   #before_validation :set_postal_code
# first_postal_code,last_postal_codeを postal_codeにまとめている記述
   # before_validation :set_postal_code

   # def first_postal_code
   # 		@first_postal_code || self.postal_code[0..2] if self.postal_code.present?
   # end

   # def last_postal_code
   # 		@last_postal_code || self.postal_code[3..6] if self.postal_code.present?
   # end

   # def set_postal_code
   # 		self.postal_code = [@first_postal_code,@last_postal_code].join
   # end

#mail送信用
  # def self.send_report
  #   InquiryMailer.report(EndUser.first).deliver_now
  # end

end
