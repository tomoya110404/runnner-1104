class CreateFavoriteCounts < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_counts do |t|
      t.references :user,  foreign_key: true
      t.references :article,   foreign_key: true
      t.timestamps
    end
  end
end
