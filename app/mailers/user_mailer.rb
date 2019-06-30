class UserMailer < ApplicationMailer
	def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  # def checkout_email(user)
  #   @user = user
  #   @url  = 'http://example.com/login'
  #   mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  # end

  def checkout_email(current_user,booking_data,create_payment)
    @user = current_user
    @booking_data = booking_data
    @create_payment = create_payment
    # @url  = 'http://www.moveu.cl'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

end
