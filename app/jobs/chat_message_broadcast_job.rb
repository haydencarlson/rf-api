class ChatMessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(chat_message)
    ActionCable
      .server
      .broadcast('chat_channel', { type: 'ADD_NEW_CHATBOX_MESSAGE_TO_LIST', payload: {
        content: chat_message[:content],
        id: chat_message[:id],
        username: chat_message.user[:nickname],
        created_at: chat_message.created_at,
        created_at: chat_message.updated_at
        }})

  end
end
