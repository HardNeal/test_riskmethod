class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.references :category, foreign_key: true
      t.integer :user_id

      t.timestamps
    end
  end
end
