class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates :body, presence: { message: "不能空白！" }
  validates :body, length: { maximum: 80, message:  "不能超過 80 字" }
  validates :user_id, presence: true
  validates :post_id, presence: true
end
