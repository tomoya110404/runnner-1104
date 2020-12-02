class Article < ApplicationRecord
  
  # アクティブハッシュ
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  # 画像投稿
  has_one_attached :image

  # アソシエーション
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # バリデーション
  with_options presence: true do
    validates :title
    validates :menu
    validates :free_text
    validates :hapning
    validates :category_id, numericality: { other_than: 1 }
  end


end
