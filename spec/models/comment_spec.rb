require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe "コメントを投稿する" do
    context "コメントを投稿できるとき" do
      it "コメントが存在すれば投稿できること" do
        expect(@comment).to be_valid
      end
    end

    context "コメントが投稿できないとき" do
      it "コメントが存在しないと保存できない" do
        @comment.comment = ""
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Comment can't be blank")
      end

      it "コメントが存在しないと保存できない" do
        @comment.comment = ""
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Comment can't be blank")
      end

      it 'userが紐付いていないと保存できないこと' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("User must exist")
      end

      it 'articleが紐付いていないと保存できないこと' do
        @comment.article = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Article must exist")
      end
    end
  end
end
