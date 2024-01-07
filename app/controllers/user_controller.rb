class UserController < ApplicationController
  # before_action :authenticate_user! , only: [:index, :show]
  before_action :get_current_user, only: [:show]

  def index
    @user = current_user
    @users = User.all
  end

  def show
    @posts = @user.posts
  end

  private
  def get_current_user
    @user = User.find(params[:id])
  end
end
