class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string       :title,    null: false
      t.text         :menu,     null: false
      t.text         :free_text
      t.text         :hapning     
      t.integer      :category_id,         null: false
      t.boolean      :checked
      t.references  :user,      foreign_key: true
      t.timestamps
    end
  end
end
