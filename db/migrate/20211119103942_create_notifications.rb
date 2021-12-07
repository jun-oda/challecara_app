class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.string :action, default: ' ', null: false
      t.boolean :checked, default: false, null: false
      
      t.timestamps
    end
  end
end
