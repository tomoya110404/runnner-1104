require 'rails_helper'

RSpec.describe Meal, type: :model do
  before do
    @meal = FactoryBot.build(:meal)
  end

  describe "食事管理投稿機能" do
    context "食事メニューが投稿できる時" do
      it "入力欄すべてが埋まれば投稿できる" do
        expect(@meal).to be_valid
      end
    end

    context "食事メニューが投稿できない時" do 
      it 'nameが空のとき保存できない' do
        @meal.name = ''
        @meal.valid?
        expect(@meal.errors.full_messages).to include("Name can't be blank")
      end
      it 'kondateが空のとき保存できない' do
        @meal.kondate = ''
        @meal.valid?
        expect(@meal.errors.full_messages).to include("Kondate can't be blank")
      end
      it 'recipeが空のとき保存できない' do
        @meal.recipe = ''
        @meal.valid?
        expect(@meal.errors.full_messages).to include("Recipe can't be blank")
      end

    end
  end
end
