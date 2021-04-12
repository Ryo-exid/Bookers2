class BooksController < ApplicationController
  def new
    @books = Book.all
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def index
    @books = Book.all
    @book = Book.new
    @users = User.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy

  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :profile_image)
  end

end
