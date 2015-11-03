class TopicsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :older_topics]

  def index
    fixed_topics_ids = FixedTopicsId.fixed_topics_ids
    @fixed_topics = Topic.find(fixed_topics_ids)

    ids = Topic.limit(30).pluck(:id)
    ids = ids - fixed_topics_ids
    @topics = Topic.find(ids)
  end

  def show
    @topic = Topic.friendly.find(params[:id])
    impressionist(@topic)
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





  def older_topics
    fixed_topics_ids = FixedTopicsId.fixed_topics_ids
    number_topics_on_page = params[:number_topics_on_page]

    if fixed_topics_ids - Topic.limit(number_topics_on_page).pluck(:id) == []
      @older_topics = Topic.offset(
        number_topics_on_page
      ).limit(30)
    else
      @older_topics = Topic.offset(
        number_topics_on_page - fixed_topics_ids.count
      ).limit(30)
    end

    render layout: false
  end

private

  def topic_params
    params.require(:topic).permit(:title).merge({user_id: current_user.id})
  end

  def post_params
    params.require(:post).permit(:content).merge({user_id: current_user.id})
  end
end
