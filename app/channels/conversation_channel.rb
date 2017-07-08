class ConversationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room-#{params['room']}"
  end

  def unsubscribed
  end
end
