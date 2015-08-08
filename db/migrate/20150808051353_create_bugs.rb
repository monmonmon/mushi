class CreateBugs < ActiveRecord::Migration
  def change
    create_table :bugs do |t|
      t.references :bug, index: true
      t.string :name, null: false
      t.string :keyname, null: false

      t.timestamps null: false
    end
  end
end
