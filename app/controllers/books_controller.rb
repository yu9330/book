class BooksController < ApplicationController

  before_action :authenticate_user!,except: [:index_read]

  def new
    @book = Book.new
    if signed_in?
      @user = User.where(user_id: current_user.id)
    end
  end

  def create

    if signed_in?
      @user = User.where(user_id: current_user.id)
    end

    @book = Book.new(book_params)

    if @book.save
      flash[:success] = "登録完了しました"
      redirect_to "/books/index_read"
    else
      flash[:danger] = "登録をやり直してください"
      render :new
    end
  end

  def index_unread
    @books = Book.where(status: "unread" ,user_id: current_user.id)
  end

  def index_read
    if signed_in?
      @books = Book.where(status: "read",user_id: current_user.id)
    else
      @books = Book.where(status: "read")
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if book.update(book_params)
      if book_params[:status] == "read"
        flash[:success] = "再編集、完了"
        redirect_to index_read_books_path
      elsif book_params[:status] == "unread"
        flash[:denger] = "再編集に失敗しました"
        redirect_to index_unread_books_path
      end
    else
      render :edit
    end
  end

  def show
  end

  private

  def book_params
    params.require(:book).permit(:title,:publisher,:author,:review,:start_date,:end_date,:status,:user_id)
  end

end
