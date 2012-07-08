class AddTokenToConvidado < ActiveRecord::Migration
  def change
    add_column :convidados, :token, :string
  end
end
