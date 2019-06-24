class OrderAppend < ApplicationRecord


	# has_many :products, through: :order_details
	has_many :order_details
	belongs_to :end_user, class_name: "EndUser", foreign_key: "enduser_id"

	# 論理削除された値を持ってくるため
	# 確実にdeleteさせたい場合は、 EndUser.with_deleted.find(6)　このようにかく

	# validates :name,presence: true
 #    validates :address,length:{ in: 10..20}

# enum記述
	enum status: { 未配送: 0, 配送中: 1, 配送完了: 2}

# enum記述
	enum pay: { 代引き: 0, クレジットカード: 1, 銀行振込: 2}

end
