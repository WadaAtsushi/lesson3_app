class PostsController < ApplicationController
  def top
  end

  def new
    @post = Post.new
  end

  def create
     @post = @current_user.posts.build(post_params)
    #  @post = Post.new(post_params)
    #  @post.user_id = @current_user.id
     

    if @post.save
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
    @post_search = Post.new
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
    @post.update(post_params)
    
    if params[:post][:image]
      @post.image_post = "#{@post.id}.jpg"
      image = params[:post][:image]
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

  def event_search
    @post_search = Post.new
    @posts = Post.where(event_id: params[:post][:event_id])
    render("posts/event_index")
  end

  private
    def post_params
      params.require(:post).permit(:title, :event_id, :content, :image_post) 
    end

end
