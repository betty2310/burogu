class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_user

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.build
  end
  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:success] = "Post created!"
      redirect_to user_path(current_user)
    else
      flash[:error] = "Post not created!"
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def get_user
    @user = current_user
  end

  private

  def post_params
    params.require(:post).permit(:content, :title)
  end

end
