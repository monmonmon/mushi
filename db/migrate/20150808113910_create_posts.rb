class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.references :bug, index: true, foreign_key: true, null: false
      t.text :comment
      t.integer :rating, null: false, default: 0

      t.timestamps null: false
    end
  end
end
