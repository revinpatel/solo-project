class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :race
      t.string :gender
      t.integer :age
      t.string :class
      t.integer :level
      t.string :name
      t.string :alignment
      t.text :description
      t.text :equipment
      t.text :spell
      t.string :wealth

      t.timestamps
    end
  end
end
