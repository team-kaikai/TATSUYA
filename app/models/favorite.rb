class Favorite < ApplicationRecord
	belongs_to :end_user, class_name: "EndUser", foreign_key: "enduser_id"
	belongs_to :product
end
