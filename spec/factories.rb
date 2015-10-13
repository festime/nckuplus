FactoryGirl.define do
  factory :post do
    content Faker::Lorem.sentence(3)
    user
  end

  factory :user do
    name     Faker::Name.name
    email    Faker::Internet.email
    password "password"
  end

  factory :topic do
    title         Faker::Name.title
    last_reply_at Faker::Time.between(DateTime.now - 2, DateTime.now)
    association   :user, factory: :user #, strategy: :build

    factory :topic_with_posts do
      transient do
        posts_count 1
      end

      after(:create) do |topic, evaluator|
        create_list(:post, evaluator.posts_count, topic: topic, user: topic.user)
      end
    end
  end
end

