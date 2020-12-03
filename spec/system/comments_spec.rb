require 'rails_helper'

RSpec.describe "Comments", type: :system do
  before do
    @article = FactoryBot.create(:article)
    @user = FactoryBot.create(:user)
    @comment = Faker::Lorem.sentence
  end

  it 'ログインしたユーザーはツイート詳細ページでコメント投稿できる' do
    # ログインする
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    find('input[name="commit"]').click
    expect(current_path).to eq root_path
    # 記事一覧に遷移する
    visit articles_path
    # 詳細ページに遷移する
    visit article_path(@article)  
    # フォームに情報を入力する
    fill_in 'コメントする', with: @comment

  end

end
