class Message < ApplicationRecord
  after_create_commit :send_to_chatters
  belongs_to :user
  belongs_to :room

  private
  def send_to_chatters
    puts 'test'
    MessageJob.perform_later(self)
  end
end
