class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # バリデーション      
  with_options presence: true do
    validates :nickname
    validates :email
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

  # パスワードなしで編集する方法
  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

end
