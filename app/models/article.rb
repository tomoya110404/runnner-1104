class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category


  has_one_attached :image
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorite, dependent: :destroy

  with_options presence: true do
    validates :title
    validates :menu
    validates :free_text
    validates :hapning
  end

  validates :category_id, numericality: { other_than: 1 }
end
