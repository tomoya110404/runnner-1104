class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :article
  belongs_to :meal
  validates_uniqueness_of :article_id,  scope: :user_id
end
