class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:destroy]
  before_action :set_list, only: [:new, :create, :edit, :update]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to @list, notice: 'Bookmark was successfully added.'
    else
      flash.now[:alert] = 'Failed to add bookmark. Please ensure a movie is selected and comment is provided.'
      render "lists/show", status: :unprocessable_entity
    end
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.update(bookmark_params)
      redirect_to bookmarks_path
    else
      render :edit
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to bookmarks_path, status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
