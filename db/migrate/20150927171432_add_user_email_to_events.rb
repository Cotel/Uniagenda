class AddUserEmailToEvents < ActiveRecord::Migration
  def change
    add_column :events, :user_email, :string
  end
end
