class CreateVersions < ActiveRecord::Migration[7.0]
  def change
    create_table :versions do |t|
      t.integer :micropost_id
      t.string :content_before
      t.string :content_after
      t.string :action

      t.timestamps
    end
  end
end
