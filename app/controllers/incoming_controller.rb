class IncomingController < ApplicationController 
  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]
  def create 
    @user = User.where(email: params['sender']).first
    @topic = Topic.where(title: params[:subject]).first_or_create
    
    unless @user.name == "User"
      @topic.bookmarks.create(url: params['stripped-text'], user_id: @user.id)
    end
    # you put the message-splitting and business magic here. 
    # Find the user by using params[:sender] 
    # Find the topic by using params[:subject]
    # Assign the url to a variable after retrieving it from params["body-plain"] 
    
    # Checks if the user is nil, if so, create and save a new user 
    # Checks if the topics is nil , create and save a new topic 
    # Now that we are sure we have valid user and topic, build and save a new bookmark 
    
    # Assuming all went well 
    head 200 
  end   
end 
