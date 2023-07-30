class RemoveColumnFromVersion < ActiveRecord::Migration[7.0]
  def change
    remove_column :versions, :content_before
  end
end
