class AlbumsController < ApplicationController
  def index
    @books = Work.where(category: "album")
  end

  def create
    super("album")
  end
end
