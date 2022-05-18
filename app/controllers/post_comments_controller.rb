class PostCommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @post_comment = @post.post_comments.new(post_comment)
        @post_comment.user_id = current_user.id
        if @post_comment.save
            respond_to do |format|
                format.js { }
            end
        else
            render :new , status: :unprocessable_entity
        end
    end
    def destroy
        @post = Post.find(params[:post_id])
        @post_comment = @post.post_comments.find(params[:id])
        @comment_id = @post_comment.id
        @post_comment.destroy
        respond_to do |format|
            format.js { }
        end
    end
    private
    def post_comment
        params.require(:post_comment).permit(:comment)
    end
end
