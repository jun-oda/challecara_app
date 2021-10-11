class AddUserIdToCalenderMessages < ActiveRecord::Migration[6.1]
  def change
    add_reference :calender_messages, :user, null: false, foreign_key: true
  end
end
