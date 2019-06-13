class Product < ApplicationRecord

    has_many :carts,dependent: :destroy
	has_many :discs,dependent: :destroy
	accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true

	belongs_to :artist
	#productテーブルリセット

	attachment :profile_image


end
