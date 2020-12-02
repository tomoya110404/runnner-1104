class CreateMealFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :meal_favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :meal,  foreign_key: true
      t.index [:user_id, :meal_id], unique: true
      t.timestamps
    end
  end
end
