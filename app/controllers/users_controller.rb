class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = Book.all
    @tweet_url = URI.encode(
        "http://twitter.com/intent/tweet?original_referer=" +
        request.url +
        "&url=" +
        request.url +
        "&text=" +
        "書籍作りました！ #BookApp"
        )
  end
end
