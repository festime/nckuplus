class Posts::CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.attributes = post_params

    @comment.save
    redirect_to :back
  end

  def update
    @comment = Comment.find(params[:id])
    authorize @comment
    @comment.update(comment_params)

    respond_to do |format|
      format.js
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
