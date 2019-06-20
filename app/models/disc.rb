class Disc < ApplicationRecord

	# validates :disc_number,presence: true
	  belongs_to :product,optional: true
	  has_many :songs,dependent: :destroy
	  accepts_nested_attributes_for :songs, reject_if: :all_blank, allow_destroy: true
	  validates :disc_number,length:{in: 1..2 }


end
