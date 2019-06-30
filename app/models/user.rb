class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :authentications   
  has_many :rating_reviews
  has_many :wishlists  
  has_many :bookings

  def name
   	first_name.to_s.titlecase + " " + last_name.to_s.titlecase
  end  
end
