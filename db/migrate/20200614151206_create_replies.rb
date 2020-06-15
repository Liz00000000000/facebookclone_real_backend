class CreateReplies < ActiveRecord::Migration[6.0]
  def change
    create_table :replies do |t|
      t.integer :comment_id
      t.string :content 
      t.integer :user_id 

      t.timestamps
    end
  end
end
