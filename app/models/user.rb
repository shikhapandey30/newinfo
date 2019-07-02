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

  def is_liked(comment)
   if Like.where(:likeable => comment ,:user_id => self.id).present?
   Like.where(:likeable => comment ,:user_id => self.id).last.like==true
   end
 end

 def is_disliked(comment)
   if Like.where(:likeable => comment ,:user_id => self.id).present?
   Like.where(:likeable => comment ,:user_id => self.id).last.like==false
   end
 end

 def self.find_product(id, type)
   product= type.constantize.find(id)
   return product
 end 

end
