class RemoveUserEmailFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :user_email, :string
  end
end
