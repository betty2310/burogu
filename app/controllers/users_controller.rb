class UsersController < ApplicationController
  # before_action :authenticate_user! , only: [:index, :show]
  before_action :get_current_user, only: [:show]

  def index
    # @users = current_user
    @q = User.ransack(params[:q])
    @pagy, @users = pagy @q.result(distinct: true), items: 8
  end

  def show
    @pagy, @posts = pagy @user.posts, items: 8
  end

  private
  def get_current_user
    @user = User.find(params[:id])
  end
end
