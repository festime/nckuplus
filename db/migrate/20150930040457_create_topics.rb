class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.datetime :last_reply_at
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
