class CreateMealsComments < ActiveRecord::Migration[6.0]
  def change
    create_table :meals_comments do |t|
      t.text :meal_comment,   null: false
      t.references :user,   foreign_key: true
      t.references :meal, foreign_key: true
      t.timestamps
    end
  end
end
