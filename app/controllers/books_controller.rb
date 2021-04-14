class BooksController < ApplicationController
  def new
    @books = Book.all
    @book = Book.find(params[:id])
  end

  def create
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def index
    @books = Book.all
    @book = Book.new
    @users = User.all
    @user = current_user
    @newbook = Book.new
  end

  def show
    @user = current_user
    @book = Book.find(params[:id])
    @newbook = Book.new
  end

  def destroy
    @book = Book.find(params[:id]) # データ（レコード）を1件取得
    @book.destroy # データ（レコード）を削除
    redirect_to books_path # 投稿一覧画面へリダイレクト
  end


  private
  def book_params
    params.require(:book).permit(:title, :body, :profile_image)
  end

end
