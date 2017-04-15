class MoviesController < WorksController
  def index
    @movies = Work.where(category: "movie").order(votes_count: :desc)
  end

  def new
    super
    @path = movies_path
  end

  def create
    super("movie")
  end
end
