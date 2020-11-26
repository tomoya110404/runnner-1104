class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
         
  with_options presence: true do
    validates :nickname
    validates :email
    validates :password
  end  

  has_many :articles
  has_many :comments
  has_many :meals
  has_many :meals_comment
end
