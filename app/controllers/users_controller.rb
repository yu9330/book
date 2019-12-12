class UsersController < ApplicationController
  def
    @user = User.find(params[:id])
  end
end
