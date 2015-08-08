class CreatePostBugs < ActiveRecord::Migration
  def change
    create_table :post_bugs do |t|
      t.references :post, index: true, foreign_key: true, null: false
      t.references :bug, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
