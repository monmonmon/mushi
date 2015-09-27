class DropColumnPostsBugId < ActiveRecord::Migration
  def up
    remove_column :posts, :bug_id
  end

  def down
    add_column :posts, :bug_id, :integer, null: false
  end
end
