class Product < ApplicationRecord

    has_many :carts,dependent: :destroy
    has_many :end_users, through: :carts
	has_many :discs,dependent: :destroy
	accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true

	belongs_to :artist, optional: true
	# 親に対し、otional: trueが必要
	#productテーブルリセット

	attachment :profile_image


end
