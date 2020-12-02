require 'rails_helper'

RSpec.describe MealFavorite, type: :model do
  before do
    @meal_favorite = FactoryBot.build(:meal_favorite)
  end

  describe "お気に入り機能投稿機能" do 
    context "お気に入り登録ができるとき" do
      it "ログイン状態であり、投稿した記事本人ではないとき" do
        expect(@meal_favorite).to be_valid
      end
    end
    
    context "お気に入り登録ができないとき" do
      it 'userが紐付いていないと保存できないこと' do
        @meal_favorite.user = nil
        @meal_favorite.valid?
        expect(@meal_favorite.errors.full_messages).to include("User must exist")
      end

      it 'mealが紐付いていないと保存できないこと' do
        @meal_favorite.meal = nil
        @meal_favorite.valid?
        expect(@meal_favorite.errors.full_messages).to include("Meal must exist")
      end
    end
  end
end
