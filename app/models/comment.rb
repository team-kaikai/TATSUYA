class Comment < ApplicationRecord
	belongs_to :end_user, class_name: "EndUser", foreign_key: "enduser_id"
	belongs_to :product

	validates :comment,length:{ in:1..200 }
end
