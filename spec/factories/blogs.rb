FactoryBot.define do
  factory :blog do
    title { "test" }
    body { "body" }
    association :user
  end
end
