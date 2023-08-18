FactoryBot.define do
  factory :task do
    title { "Task Title" }
    content { "Task Content" }
    start_time { Time.now }
    association :room
  end
end
