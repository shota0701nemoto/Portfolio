FactoryBot.define do
  factory :gym do
    sequence(:name) { |n| "Gym#{n}" }
    sequence(:content) { |n| "Gym#{n}" }
    sequence(:picture) { |n| "Gym#{n}" }
  end
end
