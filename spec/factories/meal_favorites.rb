FactoryBot.define do
  factory :meal_favorite do
    association :user
    association :meal
  end
end
