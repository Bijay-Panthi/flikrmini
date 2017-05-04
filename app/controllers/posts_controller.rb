class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    #@post = Post.first
    @post = Post.find_by(id: params[:id])
  end

  def create
      post = Post.new(post_params)
      post.user = @current_user
      # irb
      cloudinary = Cloudinary::Uploader.upload( params[ "post" ][ "image" ] )

      post.image = cloudinary["url"]
      post.save
      redirect_to post_path(post)
      #redirect to "/post/#{post.id}"
  end



  def new
    @post = Post.new
  end

  def edit
    @post = Post.find_by(id: params["id"])
  end

  private
    def post_params
      params.required(:post).permit(:image, :description)
    end


end
