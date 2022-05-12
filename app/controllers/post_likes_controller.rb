class PostLikesController < ApplicationController
	# before_action :find_post
  def create
    @post_likes = current_user.post_likes.new(post_id: params[:post_id])
  respond_to do |format|
    if @post_likes.save
          
    format.html {redirect_to root_path}
    end 
    format.js { }
  end     
  end

    def destroy
       @post_like = current_user.post_likes.find(params[:id])
       @post_like.destroy
       
    respond_to do |format|
     format.html {redirect_to root_path}
     format.js { }
    end
    end

    # def find_post
    # 	# @post = Post.find_by(params[:post_id])
    # end 	
  
    def post_like_params
      params.require(:post_like).permit(:user_id, :post_id)
    end

end