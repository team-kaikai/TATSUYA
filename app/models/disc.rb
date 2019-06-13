class Disc < ApplicationRecord

	  belongs_to :product
	  has_many :songs,dependent: :destroy
	  accepts_nested_attributes_for :songs, reject_if: :all_blank, allow_destroy: true

end
