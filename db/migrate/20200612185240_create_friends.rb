class CreateFriends < ActiveRecord::Migration[6.0]
  def change
    create_table :friends do |t|
      t.integer :user_id_1
      t.integer :user_id_2

      t.timestamps
    end
  end
end
