class Meal < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :meal_favorites, dependent: :destroy
  has_many :meals_comments, dependent: :destroy

  with_options presence: true do
    validates :name
    validates :kondate
    validates :recipe
  end
end
