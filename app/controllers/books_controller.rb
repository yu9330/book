class BooksController < ApplicationController

  before_action :authenticate_user!,except: [:index_read]

  def new
  end

  def create

    @book = Book.new
    @book.title = params[:book][:title]
    @book.pabulisher = params[:book][:pabulisher]
    @book.author = params[:book][:author]
    @book.reviw = params[:book][:reviw]
    @book.start_date = params[:book][:start_date]
    @book.end_date = params[:book][:end_date]
    @book.status = params[:book][:status]

    @book.save

    redirect_to '/books/index_read'
  end

  def index_unread

  end

  def index_read
    @books = Book.all
  end

  def show
  end

end
