class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '本気ラン' },
    { id: 3, name: 'ダイエット' },
    { id: 4, name: 'ウォーキング' },
    { id: 5, name: '初心者' },
    { id: 6, name: '大会結果' }
  ]

  include ActiveHash::Associations
  has_many :articles
  
end
