class DropParentIdFromComments < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :parent_id
  end
end
