class OrderAppend < ApplicationRecord


	# has_many :products, through: :order_details
	has_many :order_details
	belongs_to :end_user, class_name: "EndUser", foreign_key: "enduser_id"


	# validates :name,presence: true
 #    validates :address,length:{ in: 10..20}

# enum記述
	enum status: { 未配送: 0, 配送中: 1, 配送完了: 2}

end
