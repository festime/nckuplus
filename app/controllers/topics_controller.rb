class TopicsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
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

    redirect_to root_path

  rescue ActiveRecord::RecordInvalid => exception
    render :new
  end

private

  def topic_params
    params.require(:topic).permit(:title).merge({user_id: current_user.id})
  end

  def post_params
    params.require(:post).permit(:content).merge({user_id: current_user.id})
  end
end
