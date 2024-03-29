class BookmarksController < ApplicationController
  before_action :find_bookmark, only: [ :destroy ]
  before_action :find_list, only: [ :new, :create ]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.create(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end

    def destroy
      @bookmark.destroy
      redirect_to list_path(@bookmark.list)
    end

  end

  private
  def find_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def find_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
