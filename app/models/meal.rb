class Meal < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :meals_comments, dependent: :destroy
end
