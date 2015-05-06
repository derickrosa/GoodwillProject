class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.integer :applicant_id
      t.string :title
      t.string :description
      t.integer :category_id
      t.date :request_date
      t.boolean :status
      t.integer :volunteers_number

      t.timestamps
    end
  end
end
