class Room < ApplicationRecord
  belongs_to :user
  has_many :messages

  def files
    Dir["#{Rails.root.join('app', 'assets','audios').to_s}/*"].map{|file_path| file_path.split('/').last}
  end
end
