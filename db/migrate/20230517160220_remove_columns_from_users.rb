class RemoveColumnsFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :encrypted_password, :string
    remove_column :users, :reset_password_token, :string
    remove_column :users, :reset_password_sent_at, :string
    remove_column :users, :remember_created_at, :string
    remove_column :users, :confirmation_token, :string
    remove_column :users, :confirmed_at, :string
    remove_column :users, :confirmation_sent_at, :string
    remove_column :users, :unconfirmed_email, :string
  end
end
