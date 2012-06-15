class CreateRepublicas < ActiveRecord::Migration
  def change
    create_table :republicas do |t|
      t.string :nome

      t.timestamps
    end
  end
end
