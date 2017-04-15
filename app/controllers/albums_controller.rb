class AlbumsController < WorksController
  def index
    @albums = Work.where(category: "album").order(votes_count: :desc)
  end

  def new
    super
    @path = albums_path
  end

  def create
    super("album")
  end
end
