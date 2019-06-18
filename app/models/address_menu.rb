class AddressMenu < ApplicationRecord

	belongs_to :end_user, foreign_key: "enduser_id"

end
