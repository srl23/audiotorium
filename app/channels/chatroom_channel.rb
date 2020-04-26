class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    room = Room.find_by(id: params['room_id'])
    reject unless room.present?
    stream_from "room#{room.id}_channel"
  end

  def unsubscribed
  end

  def send_message(data)
    current_user.messages.create(body: data["message"], room_id: params["room_id"])
  end
end
