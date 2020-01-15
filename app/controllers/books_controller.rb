class BooksController < ApplicationController

  before_action :authenticate_user!,except: [:index_read]

  def new
    @book = Book.new
  end

  def create

    @book = Book.new(book_params)

    if @book.save
      redirect_to "/books/index_read"
    else
      render :new
    end
  end

  def index_unread
    render :partial => "index.html.erb",:collection=>Book.where(status: "unread" ,user_id: current_user.id)
  end

  def index_read
    if signed_in?
      render :partial => "index.html.erb",:collection =>Book.where(status: "read",user_id: current_user.id)
    else
      render :partial => "index.html.erb",:collection => Book.where(status: "read")
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if book.update(book_params)
      if book_params[:status] == "read"
        redirect_to index_read_books_path
      elsif book_params[:status] == "unread"
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
