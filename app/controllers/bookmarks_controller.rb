class BookmarksController < ApplicationController
  before_action :set_bookmark, :find_bookmark, only: [:show, :edit, :update, :destroy]
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)

    if @bookmark.save
      redirect_to @bookmark, notice: 'Bookmark was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to bookmarks_url, notice: 'Bookmark was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def bookmark_params
    params.require(:bookmark).permit(:bookmark_id, :comment, :movie_id, :list_id, :created_at, :updated_at)
  end

  def find_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
end
