class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'chat_channel'
  end

  def unsubscribed; end

  def receive(payload)
    ChatMessage.create(
      content: payload['message'],
      user_id: current_user.id
    )
  end

end
