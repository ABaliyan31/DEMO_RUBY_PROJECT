class AddColumnFromVersion < ActiveRecord::Migration[7.0]
  def change
    add_column :versions, :content_after, :string
  end
end
