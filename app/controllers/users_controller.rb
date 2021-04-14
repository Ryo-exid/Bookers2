class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    user.save
    redirect_to user_path(id: current_user)
  end

  def index
    @users = User.all
    @books = Book.all
    @book = Book.new
    @user = current_user
    @newbook = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
    @newbook = Book.new
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
