class CreateConvidados < ActiveRecord::Migration
  def change
    create_table :convidados do |t|
      t.string :email
      t.integer :republica_id
      t.string :convite_id

      t.timestamps
    end
  end
end
