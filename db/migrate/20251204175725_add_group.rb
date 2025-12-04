class AddGroup < ActiveRecord::Migration[8.1]
  def change
    create_table :groups do |t|
      t.belongs_to :organization, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
