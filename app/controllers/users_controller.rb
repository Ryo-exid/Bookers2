class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user,only: [:edit]

  def index
    @users = User.all
    @books = Book.all
    @book = Book.new
    @user = current_user
    @newbook = Book.new
  end

  def edit
    @user = User.find(params[:id])
    unless @user == current_user.id
      redirect_to book_path(current_user)
    end
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
    @newbook = Book.new
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(user_url) unless @user == current_user
  end

end
