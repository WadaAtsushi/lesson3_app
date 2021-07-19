class PostsController < ApplicationController
  def top
  end

  def new
    @post = Post.new
  end

  def create
    @post = @current_user.posts.build(post_params)
    #@post = Post.new(post_params)
    #@post.user_id = @current_user.id

    if @post.save
       flash.notice = "投稿を確認しました"
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
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment =Comment.new
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.update(post_params)

    if @post.save
      flash[:notice] = "編集しました"
      redirect_to posts_index_path
    else
      render("posts/#{@post.id}/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.del_flag = 1
    @post.save
    flash[:notice] = "削除しました"
    redirect_to posts_index_path
  end

  def event_search
    @post_search = Post.new
    
    if params[:post][:event_id] == ""
      @posts = Post.all
      render("posts/event_index")
    else
      @posts = Post.where(event_id: params[:post][:event_id])
      render("posts/event_index")
    end
  end

 
  private
    def post_params
      params.require(:post).permit(:title, :event_id, :content, :image_post) 
    end


end
