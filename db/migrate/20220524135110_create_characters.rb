class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :strength
      t.integer :agility
      t.integer :intelligence
      t.integer :health
      t.integer :stamina
      t.integer :focus
      t.integer :mana
      t.integer :type
      t.timestamps

      t.index :name, unique: true
    end
  end
end
