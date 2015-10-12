class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @topic = Topic.find(topic_params)
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    binding.pry

    if @post.save
      redirect_to @post.topic
    else
      render :new
    end
  end

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
    params.require(:post).permit(:content).merge(topic_params)
  end

  def topic_params
    params.permit(:topic_id)
  end
end
