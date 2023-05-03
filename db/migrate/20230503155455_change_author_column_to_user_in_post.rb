class ChangeAuthorColumnToUserInPost < ActiveRecord::Migration[7.0]
  def change
    change_column :posts , :author, :user
  end
end
