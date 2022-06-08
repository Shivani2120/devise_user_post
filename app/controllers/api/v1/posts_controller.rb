class Api::V1::PostsController < Api::V1::ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_post, only: %i[ show edit update destroy ]

    # GET /posts or /posts.json
    def index
      if params[:search].present?
        @posts = current_user.posts.joins(:user).where("posts.title Like ?", "%"+params[:search]+"%")
      else    
        @posts = current_user.posts
      end
        render json: {posts: @posts}
    end

    # GET /posts/1 or /posts/1.json
    def show
      @post_attachments = @post.post_attachments.all
      render json: @posts
    end

    # GET /posts/new
    def new
      @post = current_user.posts.new
      @post_attachment = @post.post_attachments.build
    end

    # GET /posts/1/edit
    def edit
    end

    # POST /posts or /posts.json
    def create
      @post = Post.new(post_params)
      @post = current_user.posts.new(post_params)

      respond_to do |format|
        if @post.save
          params[:post][:avatar].each do |a|
            @post.post_attachments.create!(:avatar => a)
        end
          render json: @posts
        else
          render error: { error: "Unable to create User "}, status: 400
        end
      end
    end

    # PATCH/PUT /posts/1 or /posts/1.json
    def update
      respond_to do |format|
        if @post.update(post_params)
          render json: {message: "user successfully updated"}, status:200
        else
          render json: { error: "Unable to update User."}, status:400
        end
      end
    end

    # DELETE /posts/1 or /posts/1.json
    def destroy
       if @post.destroy
         render json: {message: "Posts successfully deleted"}, status: 200
       else
         render json: {error: "Posts unable to delete "}, status: 200
       end
    end

    def like_unlike
      @post = Post.find_by(id: params[:post_id])
      return redirect_to root_path if @post.blank?
      if @post.post_likes.where(user_id: current_user.id).present?
        @button_name = "Like"
        @post.post_likes.where(user_id: current_user.id).destroy_all
          respond_to do |format|
            format.html {redirect_to root_path}
            format.js { }
          end     
      else
        @post_like = current_user.post_likes.new(post_id: @post.id, user_id: current_user.id)
        if @post_like.save
          @button_name = "Unlike"
          respond_to do |format|
            format.html {redirect_to root_path}
            format.js { }
          end
        else
          redirect_to root_path
        end
      end
      @like_count = @post.post_likes.count
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = current_user.posts.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:description, :title, :user_id)
    end

end
