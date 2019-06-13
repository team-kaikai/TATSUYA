class Disc < ApplicationRecord


	has_many :songs,dependent: :destroy
	accepts_nested_attributes_for :songs, reject_if: :all_blank, allow_destroy: true


	belongs_to :product


end
