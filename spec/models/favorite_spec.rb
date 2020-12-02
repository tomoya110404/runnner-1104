require 'rails_helper'

RSpec.describe Favorite, type: :model do
  before do
    @favorite = FactoryBot.build(:favorite)
  end

  describe "お気に入り機能投稿機能" do 
    context "お気に入り登録ができるとき" do
      it "ログイン状態であり、投稿した記事本人ではないとき" do
        expect(@favorite).to be_valid
      end
    end

    context "お気に入り登録ができないとき" do
      it 'userが紐付いていないと保存できないこと' do
        @favorite.user = nil
        @favorite.valid?
        expect(@favorite.errors.full_messages).to include("User must exist")
      end

      it 'articleが紐付いていないと保存できないこと' do
        @favorite.article = nil
        @favorite.valid?
        expect(@favorite.errors.full_messages).to include("Article must exist")
      end
    end
  end
end
