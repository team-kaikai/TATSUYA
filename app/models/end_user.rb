class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cars, dependent: :destroy


   attr_writer :first_postal_code, :last_postal_code

   #validates :postal_code,format: {with: /\A\d{7}\z/}
   #validates :first_postal_code, presence: true
   #validates :last_postal_code, presence: true

   before_validation :set_postal_code

   def first_postal_code
   		@first_postal_code || self.address[0..2] if self.address.present?
   end

   def last_postal_code
   		@last_postal_code || self.address[3..6] if self.address.present?
   end

   def set_postal_code
   		self.postal_code = [@first_postal_code,@last_postal_code].join
   end

end
