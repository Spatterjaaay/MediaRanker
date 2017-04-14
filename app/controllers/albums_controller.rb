class AlbumsController < WorksController
  def index
    @albums = Work.where(category: "album")
  end

  def new
    super
    @path = albums_path
  end

  def create
    super("album")
  end
end
