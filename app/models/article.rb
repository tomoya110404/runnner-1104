class Article < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :menu
    validates :free_text
    validates :hapning
  end
end
