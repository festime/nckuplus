class Topic < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug, use: :slugged

  belongs_to :user
  belongs_to :category
  has_many :posts, dependent: :destroy

  validates :title, presence: true
  validates :user_id, presence: true

  default_scope { order(created_at: :desc) }

  after_create :generate_slug

  def reply_count
    self.posts.count - 1
  end

private

  MAX_RETRIES = 3
  def generate_slug
    update_column :slug, SecureRandom.hex(3)
  rescue ActiveRecord::RecordNotUnique => e
    @token_attempts = @token_attempts.to_i + 1
    retry if @token_attempts < MAX_RETRIES
    raise e, "Retries exhausted"
  end
end
