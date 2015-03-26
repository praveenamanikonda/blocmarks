class LikesController < ApplicationController
  
  def create  
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.find(params[:bookmark_id])
    @like = current_user.likes.build(bookmark: @bookmark)
    
    if @like.save 
      flash[:notice] = "Bookmark was liked."
      redirect_to [@topic, @bookmark]
    else 
      flash[:notice] = "There was an error. please try again."
      redirect_to [@topic, @bookmark]
    end 
    
  end 
  
  def destroy 
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.find(params[:bookmark_id])
    like = current_user.likes.where(bookmark_id: @bookmark.id).first
    
    if like.destroy 
      flash[:notice] = "Bookmark was unliked."
      redirect_to [@topic, @bookmark]
    else 
      flash[:notice] = "There was an error. please try again."
      redirect_to [@topic, @bookmark]
    end 
  end 
  
end
