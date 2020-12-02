FactoryBot.define do
  factory :meals_comment do
    meal_comment {Faker::Lorem.sentence}
    association :user
    association :meal
  end
end
