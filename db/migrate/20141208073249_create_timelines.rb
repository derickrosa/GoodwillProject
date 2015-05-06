class CreateTimelines < ActiveRecord::Migration
  def change
    create_table :timelines do |t|
      t.integer :user_id
      t.integer :request_id

      t.timestamps
    end
  end
end
