class ContactUsController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.valid?
      
      flash[:success] = 'Your message has been sent successfully!'
      redirect_to contact_us_path
    else
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :subject, :body)
  end
end
