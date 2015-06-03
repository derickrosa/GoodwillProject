class AddGroupRefToApplication < ActiveRecord::Migration
  def change
    add_reference :applications, :group, index: true
  end
end
