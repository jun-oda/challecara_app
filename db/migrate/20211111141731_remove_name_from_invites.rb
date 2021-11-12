class RemoveNameFromInvites < ActiveRecord::Migration[6.1]
  def change
    remove_column :invites, :name, :string
  end
end
