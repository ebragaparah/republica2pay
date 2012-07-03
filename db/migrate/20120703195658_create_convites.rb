class CreateConvites < ActiveRecord::Migration
  def change
    create_table :convites do |t|
      t.text :mensagem

      t.timestamps
    end
  end
end
