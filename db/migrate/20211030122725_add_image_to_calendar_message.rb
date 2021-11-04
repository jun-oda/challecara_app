class AddImageToCalendarMessage < ActiveRecord::Migration[6.1]
  def change
    add_column :calendar_messages, :image, :string
  end
end
