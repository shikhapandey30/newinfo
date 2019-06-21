class Authentication < ActiveRecord::Base
	belongs_to :user
	# validates :provider, :uid, :presence => true

	def self.from_omniauth(auth)
    if auth[:provider] == "twitter"
        email =  auth[:info][:nickname] + '@' + 'gmail.com'
    
    end

    if auth[:provider] == "linkedin"
        email =  auth.extra.raw_info.id.to_s+"@gmail.com"
       
    else
        email = auth[:email].present? ? auth[:email] :  auth[:info][:email]
        
    end

    if auth[:provider] == "instagram"
        email =  auth[:info][:nickname] + '@' + 'gmail.com'    
    end
    
    authenticate = where(provider: auth[:provider], :uid=>auth[:uid]).first_or_initialize
    if authenticate.user
      authenticate.provider = auth[:provider]
      authenticate.uid =auth[:uid]
  
    else
        if auth['provider'].downcase == "facebook"
           email = auth[:email].present? ? auth[:email] :  auth[:uid].to_s+"@facebook.com"
        elsif auth['provider'].downcase == "google"
            email = auth[:email].present? ? auth[:email] :  auth[:uid].to_s+"@google.com"
        end
        user = User.find_or_initialize_by(:email => email)
        authenticate.provider = auth[:provider]
        authenticate.uid = auth[:uid]
        user.email = email
        user.save(validate: false)
        authenticate.user_id = user.id
     end
    authenticate.save
    authenticate.user
	end
end
