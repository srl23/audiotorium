class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    room = Room.find_by(id: params['room_id'])
    reject unless room
    room.chatters << current_user
    stream_from "room#{room.id}_channel"
  end

  def unsubscribed
    room = Room.find_by(id: params['room_id'])
    room.chatters.delete current_user
  end

  def speak

  end
end
