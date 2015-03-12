class UserMailer < ActionMailer::Base
  default from: "notifications@nitrousbox.com"
  
  def welcome_email(user)
    @user = user 
    email_with_name = %("#{@user.name}" <#{@user.email}>)
    @url = 'http://violet-box-11-171909.usw1-2.nitrousbox.com/login'
    mail(to: email_with_name, subject: 'Welcome to Blocmarks')
  end
  
#   def receive(email)
#     page = Page.find_by(address: email.to.first)
#     page.emails.create(
#       subject: email.subject,
#       body: email.body 
#       )
    
#     if email.has_attachments? 
#       email.attachments.each do |attachment|
#         page.attachments.create({
#           file: attachment,
#           description: email.subject
#           })
#       end   
#     end   
#   end   
end
