class MessageBroadcastJob < ApplicationJob
  queue_as :messages

  def perform(message_id)
    message = Message.find(message_id)
    serialized_message = MessagesSerializer.new(message).as_json
    ActionCable.server.broadcast("chat_rooms_#{message.chat_room_id}_channel", message: serialized_message)
  end
end
