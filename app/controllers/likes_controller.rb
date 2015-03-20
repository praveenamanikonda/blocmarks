class LikesController < ApplicationController
  
  def create 
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)
    
    if like.save 
      flash[:notice] = "Bookmark was liked."
      redirect_to @bookmark
    else 
      flash[:notice] = "There was an error. please try again."
      render @bookmark
    end 
    
  end 
  
  def destroy 
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.liked(@bookmark)
    
    
    if like.destroy 
      flash[:notice] = "Bookmark was unliked."
      redirect_to @bookmark
    else 
      flash[:notice] = "There was an error. please try again."
      render 'bookmark/show'
    end 
  end 
  
end
