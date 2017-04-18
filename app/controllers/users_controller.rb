class UsersController < ApplicationController
  def index
  end
  
  def show
  @user = User.find_by_name(params[:id])
  end
end
