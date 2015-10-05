class Topic < ActiveRecord::Base
  has_many :posts
  has_many :category

  validates :title, presence: true
end
