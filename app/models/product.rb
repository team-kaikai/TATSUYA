class Product < ApplicationRecord


	 has_many :cars, dependent: :destroy

	has_many :discs,dependent: :destroy
	accepts_nested_attributes_for :discs

	belongs_to :artist
	#productテーブルリセット

	attachment :profile_image

end
