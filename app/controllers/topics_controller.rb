class TopicsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
    @post  = Post.new
  end

  def create
    @topic = Topic.new(topic_params)
    @post  = Post.new(post_params)

    ActiveRecord::Base.transaction do
      @topic.save!
      @post.topic = @topic
      @post.save!
      @topic.update!(last_reply_at: @topic.created_at)
    end

    binding.pry
    redirect_to root_path

  rescue ActiveRecord::RecordInvalid => exception
    binding.pry
    render :new
  end

private

  def topic_params
    params.require(:topic).permit(:title)
  end

  def post_params
    params.require(:post).permit(:content).merge({user: current_user})
  end
end
