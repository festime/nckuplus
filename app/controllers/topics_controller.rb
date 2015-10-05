class TopicsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
  end

  def new
    @topic = Topic.new
    @post  = Post.new
  end
end
