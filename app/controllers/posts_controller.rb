class PostsController < ApplicationController
  before_action :authenticate_user!

  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    @post = Post.find(params[:id])
    authorize @post

    if @post.update(post_params)
      redirect_to @post.topic
    else
      render :edit
    end
  end

private

  def post_params
    params.require(:post).permit(:content)
  end
end
