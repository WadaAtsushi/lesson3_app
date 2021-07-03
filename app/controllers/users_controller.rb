class UsersController < ApplicationController
  
  def login
    @user = User.find_by(
      email: params[:email], 
      password: params[:password]
    )
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to posts_index_path
    else
      flash[:notice] = "入力が間違っています"
      render("users/login_form")
    end
  end

  def login_form
  end

  def signin
    @user = User.new
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to top_path
  end


  def create
    @user = User.new(user_params)
    #   name: params[:name],
    #   email: params[:email],
    #   password: params[:password]
    # )
    if @user.password != params[:password_check]
      flash[:notice] = "パスワードが一致していません"
      render("users/signin")
    else
      if @user.save
        session[:user_id] = @user.id
        flash[:notice] = "新規登録しました"
        redirect_to posts_index_path
      else
        flash[:notice] = "入力内容が間違っています"
        render("users/signin")
      end
    end
  end

  def index
    @user = User.find_by(id: session[:user_id])
  end

  private
    def user_params
      params.permit(:name, :email, :password) 
    end

end
