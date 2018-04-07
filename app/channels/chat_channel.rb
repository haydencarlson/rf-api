class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'chat_channel'

    ## Sends initial messages to front end
    initial_messages = ChatMessage.limit(50).order(created_at: :desc).to_a
    initial_messages = initial_messages.map do |message|
      message.as_json.merge(email: message.user.email)
    end
    ActionCable
      .server
      .broadcast('chat_channel', { type: 'HYDRATE_CHATBOX', payload: {
        messages: initial_messages
        }})
  end

  def unsubscribed; end

  def receive(payload)
    ChatMessage.create(
      content: payload['message'],
      user_id: current_user.id
    )
  end

end
