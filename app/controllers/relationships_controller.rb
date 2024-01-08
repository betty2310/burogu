class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    flash[:success] = "Successfully follow user #{@user.full_name}"
    respond_to do |format|
      format.html { redirect_to @user }
      format.turbo_stream
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    flash[:success] = "Successfully unfollow user #{@user.full_name}"
    respond_to do |format|
      format.html { redirect_to @user, status: :see_other }
      format.turbo_stream
    end
  end
end
