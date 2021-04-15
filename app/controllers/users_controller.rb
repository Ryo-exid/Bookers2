class UsersController < ApplicationController

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

end
