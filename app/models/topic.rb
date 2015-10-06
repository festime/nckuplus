class Topic < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :posts, dependent: :destroy

  validates :title, presence: true

  def reply_count
    self.posts.count - 1
  end
end
