class AddGroupIdToCalendar < ActiveRecord::Migration[6.1]
  def change
    add_reference :calendars, :group, null: false, foreign_key: true
  end
end
