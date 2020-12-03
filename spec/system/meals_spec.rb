require 'rails_helper'

RSpec.describe "Meals", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @meal = FactoryBot.build(:meal)
  end

  context "記事が投稿できるとき" do
    it "ログインしたユーザーは記事投稿できる" do
      #  ログインする
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      #  投稿ページに移動する
      visit new_meal_path
      #  フォームに情報を入力する
      fill_in 'タイトル', with: 'ああああああ'
      fill_in '今日のメニュー', with: 'ああああああ'
      fill_in 'レシピ', with: 'ああああああ'
      fill_in 'レシピ２', with: 'ああああああ'
      fill_in 'レシピ２', with: 'ああああああ'
      # 添付する画像を定義する
      image_path = Rails.root.join('public/images/test_image.png')
      # 画像選択フォームに画像を添付する
      attach_file('meal[image]', image_path, make_visible: true)
      #  送信するとarticleモデルのカウントが1上がることを確認する
      expect {
        find('input[name="commit"]').click
      }.to change { Meal.count }.by(1)
      #  記事一覧ページにに遷移する
      expect(current_path).to eq meals_path
      #  記事一覧ページには先ほど投稿した内容のツイートが存在することを確認する（画像）
      expect(page).to have_selector('img')
      #  記事一覧ページには先ほど投稿した内容のツイートが存在することを確認する（テキスト）
    end
  end

  context '記事の投稿ができないとき'do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      # トップページに遷移する
      visit root_path
      # 新規投稿ページへのリンクがない
      visit new_meal_path
      # ログイン画面にリダイレクトされる
      visit new_user_session_path
    end
  end  
end


RSpec.describe "記事詳細", type: :system do
  before do
    @meal = FactoryBot.create(:meal)
    @user = FactoryBot.create(:user)
  end

    it "ログインしたユーザーは練習記事詳細ページに遷移してコメント投稿欄が表示される" do
      # ログインする
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 記事一覧に遷移する
      visit meals_path
      # 詳細ページに遷移する
      visit meal_path(@meal)
      # 詳細ページに練習記事の内容が含まれている
      expect(page).to have_content("#{@meal.name}")
      expect(page).to have_content("#{@meal.kondate}")
      expect(page).to have_content("#{@meal.recipe}")
      expect(page).to have_content("#{@meal.recipe2}")
      expect(page).to have_content("#{@meal.recipe3}")
      expect(page).to have_selector 'img'
      # コメント用のフォームが存在する
      expect(page).to have_selector 'form'
    end
    it 'ログインしていない状態で練習記事詳細ページに遷移できるもののコメント投稿欄が表示されない' do
      # ログインする
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 記事一覧に遷移する
      visit meals_path
      # 詳細ページに遷移する
      visit meal_path(@meal)
      # 詳細ページに練習記事の内容が含まれている
      expect(page).to have_content("#{@meal.name}")
      expect(page).to have_content("#{@meal.kondate}")
      expect(page).to have_content("#{@meal.recipe}")
      expect(page).to have_content("#{@meal.recipe2}")
      expect(page).to have_content("#{@meal.recipe3}")
      expect(page).to have_selector 'img'
      # コメント用のフォームが存在しない

      # 「コメントの投稿には新規登録/ログインが必要です」が表示されていることを確認する

    end
end
RSpec.describe '記事編集', type: :system do
  before do
    @meal1 = FactoryBot.create(:meal)
    @meal2 = FactoryBot.create(:meal)
  end

  context '記事編集ができるとき' do
    it "ログインしたユーザーは自分が投稿した記事を編集できる" do
      # article1を投稿したユーザーでログインする
      visit new_user_session_path
      fill_in 'Email', with: @meal1.user.email
      fill_in 'Password', with: @meal1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 記事一覧に遷移する
      visit meals_path
      # 記事詳細ページに遷移する
      visit meal_path(@meal1.id)
      # article1に「編集」ボタンがあることを確認する
      expect(page).to have_link '編集', href: edit_meal_path(@meal1)
      # 編集ページへ遷移する
      visit edit_meal_path(@meal1.id)
      # すでに投稿済みの内容がフォームに入っていることを確認する
      expect(
        find('#meal_name').value
      ).to eq @meal1.name
      expect(
        find('#meal_kondate').value
      ).to eq @meal1.kondate
      expect(
        find('#meal_recipe').value
      ).to eq @meal1.recipe
      expect(
        find('#meal_recipe2').value
      ).to eq @meal1.recipe2
      expect(
        find('#meal_recipe3').value
      ).to eq @meal1.recipe3
      # expect(
        # find('option[value="2"]').value
      # ).to eq @article1.category_id
      # 投稿内容を編集する
      fill_in 'タイトル', with: "#{@meal1.name} + い"
      fill_in '今日のメニュー', with: "#{@meal1.kondate} + い"
      fill_in 'レシピ', with: "#{@meal1.recipe} + い"
      fill_in 'レシピ２', with: "#{@meal1.recipe2} + い"
      image_path = Rails.root.join('public/images/test_image.png')
      attach_file('meal[image]', image_path, make_visible: true)
      # 編集してもArticleモデルのカウントは変わらないことを確認する
      expect {
        find('input[name="commit"]').click
      }.to change { Meal.count }.by(0)
      # 記事詳細ページに遷移するに遷移する
      visit meal_path(@meal1.id)
      # 記事詳細ページには先ほど変更した内容が存在することを確認する（画像）
      expect(page).to have_selector('img') 
      # 記事詳細ページには先ほど変更した内容が存在することを確認する（テキスト）
      expect(page).to have_content ("#{@meal1.name} + い")
      expect(page).to have_content ("#{@meal1.kondate} + い")
      expect(page).to have_content ("#{@meal1.recipe} + い")
      expect(page).to have_content ("#{@meal1.recipe2} + い")
    end
  end

  context '記事編集ができないとき' do
    it 'ログインしたユーザーは自分以外が投稿した練習記事の編集画面には遷移できない' do
      # article1を投稿したユーザーでログインする
      visit new_user_session_path
      fill_in 'Email', with: @meal1.user.email
      fill_in 'Password', with: @meal1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 記事一覧に遷移する
      visit meals_path
      # article2記事詳細ページに遷移する
      visit meal_path(@meal1.id)
      # article1に「編集」ボタンがないことを確認する
      expect(page).to have_no_link "編集", href: edit_meal_path(@meal2)
    end
    it 'ログインしていない練習記事の編集画面には遷移できない' do
      # トップページにいる
      visit root_path
      # 記事一覧に遷移する
      visit meals_path
      # article1記事詳細ページに遷移する
      visit meal_path(@meal1.id)
      # article1に「編集」ボタンがないことを確認する
      expect(page).to have_no_link "編集", href: edit_meal_path(@meal1)
    end
  end
end  

RSpec.describe '記事削除', type: :system do
  before do
    @meal1 = FactoryBot.create(:meal)
    @meal2 = FactoryBot.create(:meal)
  end

  context '記事削除ができるとき' do
    it "ログインしたユーザーは自分が投稿した記事を削除できる" do
      # article1を投稿したユーザーでログインする
      visit new_user_session_path
      fill_in 'Email', with: @meal1.user.email
      fill_in 'Password', with: @meal1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 記事一覧に遷移する
      visit meals_path
      # 記事詳細ページに遷移する
      visit meal_path(@meal1.id)
      # article1に「削除」ボタンがあることを確認する
      expect(page).to have_link '削除', href: meal_path(@meal1)
      # 削除ボタンを押す
      expect {
        find_link("削除", href: meal_path(@meal1)).click
      }.to change { Meal.count }.by(-1)
      # 記事一覧画面に遷移したことを確認する
       expect(current_path).to eq meals_path
      # 記事一覧画面にはツイート1の内容が存在しないことを確認する（画像）
      expect(page).to have_no_content('img') 
      # 記事一覧画面にはツイート1の内容が存在しないことを確認する（テキスト）
      expect(page).to have_no_content("#{@meal1}")

    end
  end

  context '記事削除ができないとき' do
    it 'ログインしたユーザーは自分以外が投稿したarticleの削除をすることが出来ない' do
      # article1を投稿したユーザーでログインする
      visit new_user_session_path
      fill_in 'Email', with: @meal1.user.email
      fill_in 'Password', with: @meal1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 記事一覧に遷移する
      visit meals_path
      # article2記事詳細ページに遷移する
      visit meal_path(@meal1.id)
      # article1に「編集」ボタンがないことを確認する
      expect(page).to have_no_link "削除", href: meal_path(@meal2)
    end
    it 'ログインしていないとツイートの編集画面には遷移できない' do
      # トップページにいる
      visit root_path
      # 記事一覧に遷移する
      visit meals_path
      # article1記事詳細ページに遷移する
      visit meal_path(@meal1.id)
      # article1に「編集」ボタンがないことを確認する
      expect(page).to have_no_link "削除", href: meal_path(@meal1)
    end
  end

end
