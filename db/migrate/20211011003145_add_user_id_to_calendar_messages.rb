class AddUserIdToCalendarMessages < ActiveRecord::Migration[6.1]
  def change
    add_reference :calendar_messages, :user, null: false, foreign_key: true
  end
end
