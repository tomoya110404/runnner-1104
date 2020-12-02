FactoryBot.define do
  factory :meal do
      name { "あああああ" }
      kondate { "ああああああ" }
      recipe { "あああああ" }
      recipe2 { "あああああ" }
      recipe3 {"あああああ"}
      association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end  
      
  end
end
