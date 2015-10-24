class Post < ActiveRecord::Base
  after_create :update_topic_last_replay_at
  belongs_to :topic
  belongs_to :user
  has_many   :comments

  validates :content, presence: true
  validates :user_id, presence: true
  validates :topic_id, presence: true

private

  def update_topic_last_replay_at
    self.topic.update(last_reply_at: self.created_at)
  end
end
