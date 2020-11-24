class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  belongs_to :user
  has_one_attached :image
  has_many :comments

  with_options presence: true do
    validates :title
    validates :menu
    validates :free_text
    validates :hapning
  end

  validates :category_id, numericality: { other_than: 1 }
end
