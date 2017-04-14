class MoviesController < WorksController
  def index
    @movies = Work.where(category: "movie")
  end

  def new
    super
    @path = movies_path
  end

  def create
    super("movie")
  end
end
