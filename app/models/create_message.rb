class CalendarMessage < ApplicationRecord ::Migration[5.2]
  def change
    create_table :messages do |t|      
      t.string :image
      t.string :message
      t.references :group, foreign_key: true
      t.references :user, foreign_key: true
      t.references :calendar, foreign_key: true
      t.timestamps
    end
  end
end
