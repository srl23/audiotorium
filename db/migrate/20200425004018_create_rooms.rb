class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.text :name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :rooms, :name
  end
end
