class Product < ApplicationRecord
<<<<<<< HEAD
	has_many :discs
	accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true
=======

	has_many :discs,dependent: :destroy
	accepts_nested_attributes_for :discs

	belongs_to :artist
	#productテーブルリセット

	attachment :profile_image

>>>>>>> master
end
