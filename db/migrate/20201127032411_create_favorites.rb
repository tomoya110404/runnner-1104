class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :article,  foreign_key: true
      t.timestamps
      t.index [:user_id, :article_id], unique: true     # 同じユーザーが同じ投稿をお気に入りできないようにしている
    end
  end
end
