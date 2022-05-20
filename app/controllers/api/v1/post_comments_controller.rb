class Api::V1::PostCommentsController < Api::V1::ApplicationController

    def create
        @post = Post.find(params[:post_id])
        @post_comment = @post.post_comments.new(post_comment)
        @post_comment.user_id = current_user.id
        if @post_comment.save
            render json: @post_comment
        else
            render error: {error: "Unable to create comment"}, status: 542
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
        render json: {message: "comment is deleted"}
    end
    private
    def post_comment
        params.require(:post_comment).permit(:comment)
    end
end
