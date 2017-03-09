class MessagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_conversation
  load_and_authorize_resource

  def create
    @message =  @conversation.messages.build(message_params)
    @message.user = current_user

    respond_to do |format|
      if @message.save
        format.html { redirect_to conversation_path @conversation, notice: 'Message was sent.' }
        # format.json { render :show, status: :created, location: @activity }
      else
        format.html { redirect_to conversation_path @conversation, notice: 'Your message was not sent due to an error.' }
        # format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_conversation
    #find the related conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  def message_params
    params.require(:message).permit(:message)
  end



end
