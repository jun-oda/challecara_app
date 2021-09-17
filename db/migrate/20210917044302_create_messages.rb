class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.integer :calendar_id
      t.text :content

      t.timestamps
    end
  end
end
