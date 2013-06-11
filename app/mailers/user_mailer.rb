class UserMailer < ActionMailer::Base
  default :from => "fozekoshzhenya@gmail.com"
  
  def registration_confirmation(user)
    @user = user
    attachments["1.jpg"] = File.read("#{Rails.root}/public/images/1.jpg")
    mail(:to => "<#{@user.email}>", :subject => "Registered")
    

  end
end