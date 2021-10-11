class CreateCalenderMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :calender_messages do |t|
      t.text :message

      t.timestamps
    end
  end
end
