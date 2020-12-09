class Meal < ApplicationRecord
  # アソシエーション
  belongs_to :user
  has_one_attached :image
  has_many :meal_favorites, dependent: :destroy
  has_many :meals_comments, dependent: :destroy

  # バリデーション
  with_options presence: true do
    validates :name
    validates :kondate
    validates :recipe
  end

  # 食事記事検索
  def self.search(search)
    if search != ""
      Meal.where('kondate LIKE(?)', "%#{search}%")
    else
      Meal.all.includes(:user)
    end
  end

end
