class ConversationsController < ApplicationController

  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @conversations = Conversation.all
  end

  def show
    @conversation = Conversation.find(params[:id])
    @message = @conversation.messages.new
  end

  def new
    @conversation = Conversation.new
  end

  def create
    @conversation = Conversation.new(conversation_params)
    @conversation.user = current_user
    @conversation.receiver_id = params[:receiver_id]

    respond_to do |format|
      if @conversation.save
        format.html { redirect_to @conversation, notice: 'Conversation was successfully created.' }
        # format.json { render :show, status: :created, location: @conversation }
      else
        format.html { render :new }
        # format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end

  end

  def edit
    @conversation = Conversation.find(params[:id])
  end

  def update
    @conversation = Conversation.find(params[:id])
  end

  def destroy
    @conversation = Conversation.find(params[:id])
    @conversation.destroy
    respond_to do |format|
      format.html { redirect_to conversations_url, notice: 'Conversation was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def conversation_params
      params.require(:conversation).permit(:receiver_id, :subject)
    end

end
