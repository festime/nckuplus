class CreateFixedTopicsIds < ActiveRecord::Migration
  def change
    create_table :fixed_topics_ids do |t|
      t.integer :fixed_topic_id

      t.timestamps null: false
    end
  end
end
