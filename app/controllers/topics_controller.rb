class TopicsController < ApplicationController
  def index
  end

  def new
    @topic = Topic.new
    @post  = Post.new
  end
end
