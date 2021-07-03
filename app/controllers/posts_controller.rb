class PostsController < ApplicationController
  def top
  end

  def new
    @post = Post.new
  end

  def create
     @post = Post.new(post_params)
     @post.user_id = @current_user.id
     @post.image_post ="sample.jpg"

    if @post.save
      if params[:image]
        @post.image_post = "#{@post.id}.jpg"
        image = params[:image]
        File.binwrite("public/post_images/#{@post.image_post}", image.read)
        @post.save
      end
      flash[:notice] = "投稿を確認しました"
      redirect_to posts_index_path
    else
      render("posts/new")
    end
    
  end

  def index
    @posts = Post.all
  end

  def event_index
    @posts = Post.all
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = User.find_by(id: @post.user_id)
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.update_attributes(post_params)
    # @post.title = params[:title]
    # @post.content = params[:content]
    # @post.event = params[:event]
    
    if params[:image]
      @post.image_post = "#{@post.id}.jpg"
      image = params[:image]
      File.binwrite("public/post_images/#{@post.image_post}", image.read)
    end

    if @post.save
      flash[:notice] = "編集しました"
      redirect_to posts_index_path
    else
      render("posts/#{@post.id}/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "削除しました"
    redirect_to posts_index_path
  end

  private
    def post_params
      params.permit(:title, :event, :content) #.require(:post)
    end

end
