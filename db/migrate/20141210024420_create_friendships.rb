class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :user_id
      t.integer :contact_id
      t.integer :category

      t.timestamps
    end
  end
end
