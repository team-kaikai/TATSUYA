class Genre < ApplicationRecord


	has_many :products
	# validates :name,uniquess: true

end
