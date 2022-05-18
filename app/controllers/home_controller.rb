class HomeController < ApplicationController
	before_action :authenticate_user!, only: [:index]
	 def index
		@posts = Post.paginate(page: params[:page], per_page: 3)
	 end	
	
end
