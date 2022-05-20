class Api::V1::ApplicationController < ApplicationController
	protect_from_forgery with: :null_session
    before_action :get_current_user

    private
    def get_current_user
        @current_user = User.find(params[:current_user_id])
        # @post = current_user.posts.find(params[:id])
    end
end