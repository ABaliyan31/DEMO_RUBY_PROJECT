class CreateMiscroposts < ActiveRecord::Migration[7.0]
  def change
    create_table :miscroposts do |t|
      t.string :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
