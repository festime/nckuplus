class FixedTopicsId < ActiveRecord::Base
  scope :fixed_topics_ids, ->{ self.pluck(:fixed_topic_id) }
end

