class MembershipsController < ApplicationController
  def update
    respond_to do |format|
      channel = Channel.find_by(id: params[:id])
      current_user.channels << channel unless current_user.channels.include?(channel)
      format.html { redirect_to chat_url(channel.id), notice: 'Joined channel.' }
      format.json { head :no_content }
    end
  end

  def destroy
    channel = Channel.find_by(id: params[:id])
    current_user.channels.destroy(channel)
    respond_to do |format|
      format.html { redirect_to channels_url, notice: 'Left channel.' }
      format.json { head :no_content }
    end  end
end
