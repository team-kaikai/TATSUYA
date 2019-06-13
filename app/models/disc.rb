class Disc < ApplicationRecord
<<<<<<< HEAD
	  belongs_to :product
	  has_many :songs
	  accepts_nested_attributes_for :songs, reject_if: :all_blank, allow_destroy: true
=======

	belongs_to :product

	has_many :songs,dependent: :destroy
	accepts_nested_attributes_for :songs

>>>>>>> master
end
