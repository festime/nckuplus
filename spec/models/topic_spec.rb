require 'rails_helper'

RSpec.describe Topic, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:title) }

  describe "#reply_count" do
    it "returns 0 if there is no response" do
      topic = create(:topic_with_posts)
      expect(topic.reply_count).to eq(0)
    end

    it "returns the amount of response if there are several responses" do
      topic = create(:topic_with_posts, posts_count: 5)
      expect(topic.reply_count).to eq(4)
    end
  end
end
