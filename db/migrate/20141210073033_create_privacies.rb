class CreatePrivacies < ActiveRecord::Migration
  def change
    create_table :privacies do |t|
      t.integer :request_id
      t.integer :group_id

      t.timestamps
    end
  end
end
