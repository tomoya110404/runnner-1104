FactoryBot.define do
  factory :article do
    title { Faker::Name.initials(number: 2) }
    menu { "ああああああ" }
    free_text { "あああああ" }
    hapning { "あああああ" }
    category_id {"2"}

    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
