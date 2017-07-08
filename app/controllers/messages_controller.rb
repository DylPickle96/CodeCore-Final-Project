class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_conversation
  before_action :authorize_user

  def show
    @post = Post.find(@conversation.post_id)
    @messages = @conversation.messages

    @message = @conversation.messages.new
  end

  def new
    @message = @conversation.messages.new
  end

  def create
    @message = @conversation.messages.new(message_params)
    respond_to do |format|
      if @message.save
        # ActionCable.server.broadcast "room-#{@conversation.id}",
        #   message: render_message(@message)
        format.html {redirect_to conversation_messages_path(@conversation)}
        format.js {render}
      end
    end
  end

  def destroy
    @message = Message.find(params[:message_id])

    @message.destroy
    respond_to do |format|
      format.html do
        redirect_to conversation_messages_path(@conversation)
      end
      format.js {render}
    end
  end

  private

  # def render_message(message)
  #   ApplicationController.renderer.render(partial: 'messages/message', locals: {body: message.body, user: current_user })
  # end

  def message_params
    params.require(:message).permit(:body, :user_id)
  end

  def find_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  def authorize_user
    if current_user.id != @conversation.sender_id && @conversation.recipient_id != current_user.id
      redirect_to home_path
    end
  end
end
