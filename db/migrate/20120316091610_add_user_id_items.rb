class AddUserIdItems < ActiveRecord::Migration
  def up
    alter_table :items do |t|
      t.references :user
    end
  end

  def down
  end
end
