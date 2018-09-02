class MessagesController < ApplicationController
  # POST /users/:user_id/messages
  # POST /users/:user_id/messages.json
  def create
    channel = Channel.find_by(id: params[:id])
    message = Message.new(message_params)
    message.user = current_user
    message.channel = channel
    if message.save
      ActionCable.server.broadcast 'messages',
        message: message.content,
        user: message.user.alias
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:content, :user_id, :channel_id)
    end
end
