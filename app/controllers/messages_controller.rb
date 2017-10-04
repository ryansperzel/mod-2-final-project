class MessagesController < ApplicationController

  def index
    @messages = Message.all
    host_or_entertainer
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
    host_or_entertainer
  end

  def create
    @message = Message.new(message_params)
    host_or_entertainer
    @host ? @message.update(entertainer_id: Entertainer.find_by(username: message_params[:receiver]).id) : @message.update(host_id: Host.find_by(username: message_params[:receiver]).id)
    if @message.save
      redirect_to messages_path
    else
      render :new
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to messages_path
  end

  private

  def message_params
    params.require(:message).permit(:title, :content, :sender, :receiver, :host_id, :entertainer_id)
  end

  def host_or_entertainer #sets host or entertainer variable based on who's logged in
    session[:host_id] ? @host = Host.find(session[:host_id]) : @entertainer = Entertainer.find(session[:entertainer_id])
  end

end
