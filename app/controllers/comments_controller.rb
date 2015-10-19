class CommentsController < ApplicationController
  before_action :authenticate_user!

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
