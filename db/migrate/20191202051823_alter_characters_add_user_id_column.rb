class AlterCharactersAddUserIdColumn < ActiveRecord::Migration[5.2]
  def change

    add_column :characters, :user_id, :integer
    add_index :characters, :user_id

  end
end
