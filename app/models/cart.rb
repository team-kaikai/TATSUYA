class Cart < ApplicationRecord

	belongs_to :product
	belongs_to :end_user

end
