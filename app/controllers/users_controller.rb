class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    user.save
    redirect_to user_path(user.id)
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
    @user = User.find(params[:id])
    @profile_images = @user.profile_images.page(params[:page]).reverse_order
  end

  def destroy
  end

  private
  def list_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
