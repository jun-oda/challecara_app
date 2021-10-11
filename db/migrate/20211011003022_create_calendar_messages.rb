class CreateCalendarMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :calendar_messages do |t|
      t.text :message

      t.timestamps
    end
  end
end
