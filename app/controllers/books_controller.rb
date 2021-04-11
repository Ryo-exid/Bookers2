class BooksController < ApplicationController
  def new
    @book = Book.find(params[:id])
  end

  def create
    book = Book.new(_params)
    book.save
    redirect_to book_path(book.id)
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
  def list_params
    params.require(:list).permit(:title, :body, :prpfile_image)
  end

end
