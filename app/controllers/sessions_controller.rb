class SessionsController < ApplicationController
	def omniauth
		@user = User.find_or_create_by(username: auth[:info][:email]) do |u|
			u.email = auth[:info][:email]
			u.username = auth[:info][:username]
			u.uid = auth[:uid]
			u.provider = auth[:provider]
			u.password = SecureRandom.hex(10)

		if @user.valid?
           session[:user_id] = @user_id
           redirect_to photos_path
        else
           flash[:message] = "credential error"
           redirect_to login_path
        end 
      end    
	end

	private
	def auth
		request.env['omniauth.auth']
	end
end
