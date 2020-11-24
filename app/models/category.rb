class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'おすすめ周回ポイント' },
    { id: 3, name: '危険地帯' },
    { id: 4, name: '本気ラン' },
    { id: 5, name: 'ダイエット' },
    { id: 6, name: 'ゆるふわ' }
  ]

  include ActiveHash::Associations
  has_many :articles
  
end
