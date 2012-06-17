class CreateGruposUsers < ActiveRecord::Migration
  def change
    create_table(:grupos_users, :id => false)  do |t|
      t.integer :grupo_id
      t.integer :user_id
    end
  end
end
