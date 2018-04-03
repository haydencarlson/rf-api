class ChatMessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(chat_message)
    ActionCable
      .server
      .broadcast('chat_channel', { type: 'ADD_NEW_CHATBOX_MESSAGE_TO_LIST', payload: {
        text: chat_message[:content],
        username: chat_message.user[:email],
        created_at: chat_message.created_at
        }})

  end
end
