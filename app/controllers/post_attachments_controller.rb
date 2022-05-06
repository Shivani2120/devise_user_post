class PostAttachmentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @post_attachment = @post.post_attachments.new(post_attachment_params)
    if @post_attachment.save
          redirect_to post_path(@post)
    end
  end 

   def update
      if @post_attachment.update(post_attachment_params)
        redirect_to @post_attachment.post 
      end 
   end 


   private
  def post_attachment_params
    params.require(:post_attachment).permit(:post_id, :avatar)
  end 
end
