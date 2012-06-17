class AddUserToConta < ActiveRecord::Migration
  def change
    add_column :contas, :user_id, :integer
  end
end
