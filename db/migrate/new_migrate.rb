class NewMigrate < ActiveRecord::Migration[5.0]
  def change
    change_column(:microposts, :content, :string)
  end
end
