class NotificationsMailer < ActionMailer::Base
  default :from => "RoR.testing.email@gmail.com"
  
  def new_message(message)
    @message = message
    mail(:to => @message.email, :subject => "Witchcraft Support")
  end

end


