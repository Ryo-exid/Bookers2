class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    user.save
    redirect_to user_path(user_id)
  end

  def index
    @users = User.all
    @user = User.new(user_params)
  end

  def edit
    @user = current_user
    @user = User.find(params[:id])
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @user.name = current_user
  end

  def destroy
  end

  private
  def list_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
