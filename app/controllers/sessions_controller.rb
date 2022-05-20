class SessionsController < ApplicationController
	def omniauth
		@user = User.find_or_create_by(email: auth[:info][:email]) do |u|
			u.email = auth[:info][:email]
			u.name = auth[:info][:name]
			u.uid = auth[:uid]
			u.provider = auth[:provider]
			u.password = SecureRandom.hex(10)
        end   
		
		if @user.persisted?
			flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
			sign_in_and_redirect @user, :event => :authentication
		  else
			session["devise.google_data"] = request.env["omniauth.auth"].except(:extra) #Removing extra as it can overflow some session stores
			redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
		end
	end

	def twitter
		# You need to implement the method below in your model (e.g. app/models/user.rb)
		@user = User.from_omniauth(request.env["omniauth.auth"])
	
		if @user.persisted?
		  sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
		  set_flash_message(:notice, :success, kind: "Twitter") if is_navigational_format?
		else
		  session["devise.twitter_data"] = request.env["omniauth.auth"].except("extra")
		  redirect_to new_user_registration_url
		end
	  end
	
	  def failure
		redirect_to root_path
	  end
	

	private
	def auth
		request.env['omniauth.auth']
	end
end
