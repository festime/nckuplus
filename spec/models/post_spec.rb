require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:topic_id) }
end
