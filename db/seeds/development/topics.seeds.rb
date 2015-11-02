user = User.first
a = (1..50).to_a

50.times do
  n = a.sample
  time = Time.now - n.day

  topic = Topic.create(
    title: Faker::Name.title,
    user_id: user.id,
    created_at: time
  )

  post = Post.create(
    content: Faker::Lorem.paragraph(2),
    user_id: user.id,
    topic_id: topic.id,
    created_at: time
  )
end

FixedTopicsId.create(
  fixed_topic_id: Topic.first.id
)
