class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    @conversation = Conversation.find_by(id: message['conversation_id'])
    ActionCable.server.broadcast "room-#{@conversation.id}",
      message: render_message(message)
  end

  private

  def render_message(message)
    @user = User.find_by(id: message.user_id)
    ApplicationController.renderer.render(partial: 'messages/message', locals: {body: message.body, user: @user })
  end
end
