class PostsController < ApplicationController
    before_action :set_post, only: %i[ show edit update destroy ]

    # GET /posts or /posts.json
    def index
      if params[:search].present?
        @posts = current_user.posts.joins(:user).where("posts.first_name Like ?", "%"+params[:search]+"%")
      else    
        @posts = current_user.posts
      end
    end

    # GET /posts/1 or /posts/1.json
    def show
      @post_attachments = @post.post_attachments.all
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
          if params[:post][:avatar].present?
              params[:post][:avatar].each do |a|
                @post.post_attachments.create!(:avatar => a)
              end
          else
            puts "posts is unavailabel"
          end
          format.html { redirect_to post_url(@post) }
        else
          format.html { render :new }
        end
      end
    end

    # PATCH/PUT /posts/1 or /posts/1.json
    def update
      respond_to do |format|
        if @post.update(post_params)
          format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
          format.json { render :show, status: :ok, location: @post }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /posts/1 or /posts/1.json
    def destroy
      @post.destroy

      respond_to do |format|
        format.html { redirect_to posts_url(@post)}
        format.js { }
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
