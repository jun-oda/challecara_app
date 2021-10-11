class AddCalenderIdToCalenderMessages < ActiveRecord::Migration[6.1]
  def change
    add_reference :calender_messages, :calender, null: false, foreign_key: true
  end
end
