class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @conversations = Conversation.all
  end

  def create
    @post = Post.find(params[:post_id])

    if Conversation.between(params[:sender_id],params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id],
      params[:recipient_id]).first
      @conversation.post_id = @post.id

      log_in(:sender_id)
      log_in(:recipient_id)
      @conversation.save
   else
     log_in(:sender_id)
     log_in(:recipient_id)
     @conversation = Conversation.create!(conversation_params)
   end
   redirect_to conversation_messages_path(@conversation)
  end

  private


  def conversation_params
    params.permit(:sender_id, :recipient_id, :post_id)
  end
end
