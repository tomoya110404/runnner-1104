require 'rails_helper'

RSpec.describe MealsComment, type: :model do
  before do
    @meal_comment = FactoryBot.build(:meals_comment)
  end

  describe "食事管理コメント機能投稿機能" do 
    context "食事管理コメントが投稿ができるとき" do
      it "コメント入力できるとき" do
        expect(@meal_comment).to be_valid
      end
    end

    context "食事管理コメントが投稿できないとき" do
      it "コメントが存在しないと保存できない" do
        @meal_comment.meal_comment = ""
        @meal_comment.valid?
        expect(@meal_comment.errors.full_messages).to include("Comment can't be blank")
      end

      it 'userが紐付いていないと保存できないこと' do
        @meal_comment.user = nil
        @meal_comment.valid?
        expect(@meal_comment.errors.full_messages).to include("User must exist")
      end

      it 'articleが紐付いていないと保存できないこと' do
        @meal_comment.meal = nil
        @meal_comment.valid?
        expect(@meal_comment.errors.full_messages).to include("Meal must exist")
      end
    end

  end
end
