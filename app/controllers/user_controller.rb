class UserController < ApplicationController
  # before_action :authenticate_user! , only: [:index, :show]
  before_action :get_current_user, only: [:show]

  def index
    @user = current_user
    @pagy, @users = pagy User.all, items: 8
  end

  def show
    @pagy, @posts = pagy @user.posts, items: 8
  end

  private
  def get_current_user
    @user = User.find(params[:id])
  end
end
