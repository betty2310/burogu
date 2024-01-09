class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create destroy]
  before_action :get_user, only: %i[new create destroy]
  before_action :correct_user, only: :destroy

  def show
    @post = Post.find(params[:id])
    @commontable = @post
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'Post created!'
      redirect_to user_path(current_user)
    else
      flash[:error] = 'Post not created!'
      render :new
    end
  end

  def edit; end

  def update; end

  def destroy
    @post.destroy
    flash[:success] = 'Micropost deleted'
    if request.referrer.nil?
      redirect_to root_url, status: :see_other
    else
      redirect_to @user, status: :see_other
    end
  end

  private

  def get_user
    @user = current_user
  end

  def post_params
    params.require(:post).permit(:content, :title)
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to root_url, status: :see_other if @post.nil?
  end
end
