class AddressMenu < ApplicationRecord

	belongs_to :end_user, foreign_key: "enduser_id"


	validates :name,presence: true
	validates :address, {presence: true, length:{ in: 1..50}}
	validates :postal_code, {presence: true, length:{ in: 1..7}}

end
