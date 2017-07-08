class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  validates_presence_of :body, :conversation_id, :user_id

  after_create_commit do
    SendMessageJob.perform_later(self)
  end
end
