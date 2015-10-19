require 'rails_helper'

describe Comment do
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:post_id) }
  it do
    should validate_length_of(:body).
      is_at_most(80)
  end
end
