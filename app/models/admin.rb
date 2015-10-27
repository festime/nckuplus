class Admin < ActiveRecord::Base
  validates :email, uniqueness: true
end
