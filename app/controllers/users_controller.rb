class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images.page(params[:page])
    @post_comment = PostComment.new
  end

  
end
