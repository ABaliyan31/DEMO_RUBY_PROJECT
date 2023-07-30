class AddColumnPresentToMicroposts < ActiveRecord::Migration[7.0]
  def change
    add_column :microposts, :present, :integer
  end
end
