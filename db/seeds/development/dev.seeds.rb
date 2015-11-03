Topic.destroy_all
FixedTopicsId.destroy_all
Comment.destroy_all

begin
  user = User.first
  unless user
    raise "可能要先用 fb 登入一個使用者之後才能 seed 喔"
  end

  a = (1..50).to_a

  50.times do
    n = a.sample
    time = Time.now - n.day

    topic = Topic.create(
      title: Faker::Name.title,
      user_id: user.id,
      created_at: time
    )

    2.times do
      post = Post.create(
        content: Faker::Lorem.paragraph(2),
        user_id: user.id,
        topic_id: topic.id,
        created_at: time
      )

      2.times do
        comment = Comment.create(
          body: Faker::Lorem.paragraph(1),
          user_id: user.id,
          post_id: post.id
        )
      end
    end
  end

  FixedTopicsId.create(
    fixed_topic_id: Topic.first.id
  )

rescue Exception => e
  puts e.message
end

