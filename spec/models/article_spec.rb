require 'rails_helper'

RSpec.describe Article, type: :model do
  before do
    @article = FactoryBot.build(:article)
  end

  describe "練習メニュー投稿機能" do
    context "練習メニューが投稿できる時" do
      it "入力欄すべてが埋まれば投稿できる" do
        expect(@article).to be_valid
      end
    end

    context "練習メニューが投稿できない時" do 
      it 'titleが空のとき保存できない' do
        @article.title = ''
        @article.valid?
        expect(@article.errors.full_messages).to include("Title can't be blank")
      end

      it 'menuが空のとき保存できない' do
        @article.menu = ''
        @article.valid?
        expect(@article.errors.full_messages).to include("Menu can't be blank")
      end

      it "category_idが空のとき保存できない" do
        @article.category_id = ''
        @article.valid?
        expect(@article.errors.full_messages).to include("Category can't be blank")
      end

      it 'category_idが1のとき保存できない' do
        @article.category_id = '1'
        @article.valid?
        expect(@article.errors.full_messages).to include("Category must be other than 1")
      end
    end
  end
end
