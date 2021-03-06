class ChatMessage < ApplicationRecord
  belongs_to :user

  after_create_commit do
    ChatMessageBroadcastJob.perform_later(self)
  end
end
