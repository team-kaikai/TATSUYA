class Product < ApplicationRecord
	has_many :discs
	accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true
end
