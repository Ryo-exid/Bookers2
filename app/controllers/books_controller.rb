class BooksController < ApplicationController
  def new
    @books = Book.all
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id), notice: "You have created book successfully."
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @users = User.all
    @user = current_user
    # @newbook = Book.new
  end

  def show
    # p '--------------------------'
    # p flash
    @user = current_user
    @book = Book.find(params[:id])
    @newbook = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    # p '--------------------------'
    # p flash[:tsst] = 'aaa'
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: "You have updated book successfully."
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id]) # データ（レコード）を1件取得
    @book.destroy # データ（レコード）を削除
    redirect_to books_path # 投稿一覧画面へリダイレクト
  end


  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
