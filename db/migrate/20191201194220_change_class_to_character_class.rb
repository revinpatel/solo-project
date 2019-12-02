class ChangeClassToCharacterClass < ActiveRecord::Migration[5.2]
  def change
    rename_column :characters, :class, :charclass
  end
end
