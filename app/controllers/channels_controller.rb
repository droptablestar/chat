class ChannelsController < ApplicationController
  before_action :set_channel, only: [:show, :edit, :update, :destroy, :chat]
  before_action :authorized_user, only: [:destroy]

  # GET /channels
  # GET /channels.json
  def index
    @channels = Channel.includes(:admin)
  end

  # GET /channels/new
  def new
    @channel = Channel.new
  end

  # POST /channels
  # POST /channels.json
  def create
    admin = User.find_by(id: current_user)
    @channel = Channel.new(channel_params.merge(admin: admin))
    respond_to do |format|
      if @channel.save
        format.html { redirect_to chat_url(@channel.id), notice: 'Channel was successfully created.' }
        format.json { render :show, status: :created, location: @channel }
      else
        format.html { render :new }
        format.json { render json: @channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /channels/1
  # DELETE /channels/1.json
  def destroy
    @channel.destroy
    respond_to do |format|
      format.html { redirect_to channels_url, notice: 'Channel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def chat
    # would like to have messages cached for each channel
    @messages = @channel.messages.order(created_at: :desc).limit(10).includes(:user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_channel
      @channel = Channel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def channel_params
      params.require(:channel).permit(:name)
    end

    def authorized_user
      unless current_user && @channel.admin.id == current_user.id
        redirect_back(fallback_location: root_path)
      end
    end
end
