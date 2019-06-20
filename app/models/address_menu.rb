class AddressMenu < ApplicationRecord

	belongs_to :end_user, foreign_key: "enduser_id"


	validates :name,presence: true
	validates :address,length:{ in: 10..20}

end
