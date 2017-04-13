class AlbumsController < ApplicationController
  def index
    @albums = Work.where(category: "album")
  end

  def create
    super("album")
  end
end
