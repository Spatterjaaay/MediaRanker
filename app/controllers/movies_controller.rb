class MoviesController < ApplicationController
  def index
    @movies = Work.where(category: "movie")
  end

  def create
    super("movie")
  end
end
