class PostLikesController < ApplicationController
	# before_action :find_post
  def create
    @post_likes = current_user.post_likes.new(post_id: params[:post_id])
    if @post_likes.save
          
       redirect_to root_path()
    end      
   end

    def destroy
       @post_like = current_user.post_likes.find(params[:id])
       @post_like.destroy

       redirect_to root_path()
    end

    # def find_post
    # 	# @post = Post.find_by(params[:post_id])
    # end 	
  
    def post_like_params
      params.require(:post_like).permit(:user_id, :post_id)
    end

end