class AddStatsToCharacter < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :strstat, :integer
    add_column :characters, :dexstat, :integer
    add_column :characters, :constat, :integer
    add_column :characters, :intstat, :integer
    add_column :characters, :wisstat, :integer
    add_column :characters, :chastat, :integer
  end
end

