class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name 
      t.integer :age 
      t.string :bio 
      t.string :location 
      t.string :occupation 
      t.string :college 
      t.string :picture
      t.string :email
      t.string :password 

      t.timestamps
    end
  end
end
