class BookmarksController < ApplicationController
  def show
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
    authorize @bookmark
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.find(params[:id])
    authorize @bookmark
  end
  
  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = current_user.bookmarks.build(bookmark_params)
    @bookmark.topic = @topic 
    authorize @bookmark

    if @bookmark.save
      flash[:notice] = "Bookmark was saved."
      redirect_to [@topic, @bookmark]
    else
      flash[:error] = "There was an error saving the bookmark. Please try again."
      render :new
    end
  end
  
  def update
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark

    if @bookmark.update_attributes(bookmark_params)
      flash[:notice] = "Bookmark was updated."
      redirect_to [@topic, @bookmark]
    else
      flash[:error] = "There was an error saving the bookmark. Please try again."
      render :new
    end
  end
  
  def destroy
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    url = @bookmark.url
    authorize @bookmark
    
    if @bookmark.destroy
      flash[:notice] = "\"#{url}\" was deleted successfully"
      redirect_to @topic 
    else 
      flash[:error] = "There was an error deleting the bookmark."
      render :show 
    end   
  end  

  private

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end
end
