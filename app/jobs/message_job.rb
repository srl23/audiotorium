class MessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast(
      "room#{message.room_id}_channel",
      message: ApplicationController.renderer.render(partial: '/messages/message', locals: {message: message})
    )
  end
end
