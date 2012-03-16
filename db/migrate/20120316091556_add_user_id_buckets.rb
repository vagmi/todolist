class AddUserIdBuckets < ActiveRecord::Migration
  def up
    alter_table :buckets do |t|
      t.references :user
    end
  end

  def down
  end
end
