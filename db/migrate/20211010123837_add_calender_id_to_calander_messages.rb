class AddCalenderIdToCalanderMessages < ActiveRecord::Migration[6.1]
  def change
    add_reference :calander_messages, :calendar, null: false, foreign_key: true
  end
end
