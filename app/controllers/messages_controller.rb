class MessagesController < ApplicationController

  #before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    #@messages = Message.all
    puts "Hello from AFR messages"
  end

  # POST /messages
  # POST /messages.json
  def send
    users = User.all
    message = Message.all

    account_sid = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']

    @client = Twilio::REST::Client.new account_sid, auth_token

    from = ENV['TWILIO_NUMBER']

    users.each do |number|
      @client.account.messages.create(
        :from => from,
        :to => number,
        :body => message
      )
      puts "Sent message to #{number}"
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:phone_number)
    end
end
