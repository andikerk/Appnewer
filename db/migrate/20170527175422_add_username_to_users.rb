class AddUsernameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :username, :string, null: false, index: true, unique: true, default:""
  end
end
