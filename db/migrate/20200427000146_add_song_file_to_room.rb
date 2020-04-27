class AddSongFileToRoom < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :song_file, :string
  end
end
