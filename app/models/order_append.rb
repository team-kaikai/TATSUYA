class OrderAppend < ApplicationRecord

	has_many :order_details
	belongs_to :end_user, class_name: "EndUser", foreign_key: "enduser_id"

end
