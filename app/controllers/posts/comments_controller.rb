class Posts::CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    respond_to do |format|
      format.json do
        post = Post.find(params[:post_id])
        comments_id = post.comments.pluck(:id).map do |id|
          "post-#{params[:post_id]}-comment-#{id}"
        end
        comments_time = post.comments.pluck(:created_at)
        json = (Hash[*(comments_id.zip(comments_time).flatten)]).to_json
        # topics_id = Topic.pluck(:id).map { |id| "topic-#{id}" }
        # topics_time = Topic.pluck(:created_at)
        # json = (Hash[*(topics_id.zip(topics_time).flatten)]).to_json

        render :json => json
      end
    end
  end

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.attributes = post_params

    respond_to do |format|
      format.html do
        @comment.save
        redirect_to :back
      end
    end
  end

private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def post_params
    params.permit(:post_id)
  end
end
