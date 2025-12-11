class CreatePeople < ActiveRecord::Migration[8.1]
  def change
    create_table :people do |t|
      t.integer :age, limit: 1, null: false
      t.string :email, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.timestamps
    end

    create_table :organization_people do |t|
      t.belongs_to :organization, null: false, foreign_key: true
      t.belongs_to :person, null: false, foreign_key: true
      t.timestamps
    end

    create_table :group_people do |t|
      t.belongs_to :group, foreign_key: true, null: false
      t.belongs_to :person, foreign_key: true, null: false
      t.timestamps
    end
  end
end
