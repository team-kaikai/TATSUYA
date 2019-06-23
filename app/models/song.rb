class Song < ApplicationRecord

	belongs_to :disc
	validates :name, {presence: true}
	validates :track,length:{in: 1..2 }
end
