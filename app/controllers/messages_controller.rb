class MessagesController < ApplicationController
  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/1/edit
  def edit
  end

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
      # head :ok
    end
    redirect_to chat_url(params[:id])
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:content, :user_id, :channel_id)
    end
end
