class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :content
      t.boolean :status
      t.references :bucket

      t.timestamps
    end
    add_index :items, :bucket_id
  end
end
