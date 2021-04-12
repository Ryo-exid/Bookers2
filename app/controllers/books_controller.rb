class BooksController < ApplicationController
  def new
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to books_path
  end

  def index
    @users = User.all
    @user = current_user
    @user = User.find(current_user.id)
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy

  end

  private
  def book_params
    params.permit(:title, :body, :profile_image)
  end

end
