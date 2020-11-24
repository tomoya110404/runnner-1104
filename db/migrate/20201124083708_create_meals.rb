class CreateMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :meals do |t|
      t.string      :name,      null: false
      t.text        :kondate,    null: false
      t.text        :recipe,     null: false
      t.text        :recipe2      
      t.text        :recipe3
      t.references  :user,      foreign_key: true
      t.timestamps
    end
  end
end
