class CommentPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def edit?
    comment.user == user
  end

  def update?
    comment.user == user
  end
end
