class PaytmController < ApplicationController
  include PaytmHelper
  #before_filter :authenticate_user!
  # before_action :get_paytm_keys
  protect_from_forgery except: [:verify_payment]

  def start_payment
    #add application logic unique to your app
    @booking = current_user.bookings.new(booking_params)
    @booking.product_id = Product.find(params[:product_id]).id
    session[:booking] = @booking
    paramList = Hash.new
    paramList["MID"] =  ENV['MID']
    paramList["ORDER_ID"] = "#{Time.now.to_i.to_s}"
    paramList["CUST_ID"] = "#{Time.now.to_i.to_s}"
    paramList["INDUSTRY_TYPE_ID"] = ENV['INDUSTRY_TYPE_ID']
    paramList["CHANNEL_ID"] = ENV['CHANNEL_ID']
    paramList["TXN_AMOUNT"] = 2
    # paramList["MSISDN"] = current_user.phone
    paramList["EMAIL"] = current_user.email
    paramList["WEBSITE"] = ENV['WEBSITE']
    paramList["CALLBACK_URL"] = ENV['CALLBACK_URL']
    @paramList = paramList
    @checksum_hash = generate_checksum()
    respond_to do |format|
      format.js
      format.html
    end
  end 

  def verify_payment
    paytmparams = Hash.new
    keys = params.keys
    keys.each do |k|
      paytmparams[k] = params[k]
    end
    @checksum_hash = paytmparams["CHECKSUMHASH"]
    puts "checksum_hash 1111111111111111111#{@checksum_hash}"

    paytmparams.delete("CHECKSUMHASH")
    paytmparams.delete("controller")
    paytmparams.delete("action")
    @paytmparams = paytmparams
    @is_valid_checksum = verify_checksum()

    puts "testing1111111111111111111111111#{@is_valid_checksum}"

    # if @is_valid_checksum == true
      if @paytmparams["STATUS"] == "TXN_SUCCESS"
        puts "payment vijay TXN_SUCCESS"
        # current_user = User.where(email: @paytmparams["EMAIL"]).last
        # @booking = current_user.bookings.new(booking_params)
        # @booking.stay_home_id = StayHome.friendly.find(params[:stay_home_id]).id
        #     add application logic unique to your app
        @booking = session[:booking]
        # @create_payment = create_payment
        # @create_payment.save!
        @booking.delete('id')
        @booking_data = current_user.bookings.new(@booking)
        respond_to do |format|
          @booking_data.save!
          @create_payment = create_payment
          @create_payment.save!
          # UserMailer.welcome_email(current_user).deliver_now
          # UserMailer.checkout_email(current_user, @booking_data, @create_payment).deliver_now
          # UserMailer.admincheckout_email(current_user, @booking_data, @create_payment).deliver_now
         format.html { redirect_to @booking_data, notice: 'Booking was successfully created.' }
      #   # format.json { render :show, status: :created, location: @booking }
        end
      else
      #     add logic unique to your app
        respond_to do |format|
          format.html
        end
      end
    # end
  end

  def create_payment
    @payment = Payment.new
    @payment.order_id = params[:ORDERID]
    @payment.txn_id = params[:TXNID]
    @payment.txn_amount = params[:TXNAMOUNT]
    @payment.payment_mode = params[:PAYMENTMODE]
    @payment.txn_date = params[:TXNDATE]
    @payment.status = params[:STATUS]
    @payment.getway = params[:GATEWAYNAME]
    @payment.bank_txn_id = params[:BANKTXNID]
    @payment.booking_id = @booking_data.id
    if params[:BANKNAME].nil?
      @payment.bank_name = params[:BANKNAME]
    end
    return @payment
  end

  private

  # def get_paytm_keys
  #   ENV=Rails.application.config.paytm_keys
  # end
  def booking_params
      params.require(:booking).permit(:user_id, :product_id)
    end
end