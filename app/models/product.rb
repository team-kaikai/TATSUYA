class Product < ApplicationRecord
	# enum記述
	enum status: {
		販売中:1, 停止中:2
	}

    has_many :carts,dependent: :destroy
    has_many :end_users, through: :carts
	has_many :discs,dependent: :destroy
	has_many :order_details,dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :favorites, dependent: :destroy


	accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true

	belongs_to :artist, optional: true
	belongs_to :label, optional: true
	belongs_to :genre, optional: true
	# 親に対し、optional: trueが必要
	#productテーブルリセット

	def total_price
		product.price * quantity
	end

	attachment :profile_image

	def favorited_by?(enduser)
        favorites.where(enduser_id: enduser.id).exists?
    end

end
