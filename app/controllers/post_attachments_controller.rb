class PostAttachmentsController < ApplicationController
   def update
      respond_to do |format|
        if @post_attachment.update(post_attachment_params)
          format.html { redirect_to @post_attachment.post, notice: 'Post attachment was successfully updated.' }
        end 
      end
   end 
end
