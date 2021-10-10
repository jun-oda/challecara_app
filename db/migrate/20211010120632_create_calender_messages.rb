class CreateCalenderMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :calender_messages do |t|
      
      t.text :message, null: false

      t.timestamps
    end
  end
end
