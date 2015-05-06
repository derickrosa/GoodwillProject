class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer :resquest_id
      t.integer :applicant_id
      t.integer :volunteer_id
      t.boolean :status

      t.timestamps
    end
  end
end
