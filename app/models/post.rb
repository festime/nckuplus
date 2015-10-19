class Post < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  has_many   :comments

  validates :content, presence: true
  validates :user_id, presence: true
  validates :topic_id, presence: true
end
