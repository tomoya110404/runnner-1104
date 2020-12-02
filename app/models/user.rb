class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # バリデーション      
  with_options presence: true do
    validates :nickname
    validates :email
    validates :password
  end  
  
  # 運動管理記事
  has_many :articles
  has_many :comments
  has_many :favorites
  has_many :meal_favorites

  # 食事記事
  has_many :meals
  has_many :meals_comment

  #画像添付


end
