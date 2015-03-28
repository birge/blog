class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.valid?
      @message.save
      flash[:success] = ["Thanks for the Email"]
      redirect_to root_url
    else
      flash.now[:danger] = @message.errors.full_messages
      render 'new'
    end
  end

  private
    def message_params
      params.require(:message).permit(:name, :email, :subject, :body)
    end
end
