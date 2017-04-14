class WorksController < ApplicationController
  def index
    @works = Work.all
  end

  def show
    @result_work = Work.find(params[:id])
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    @work = Work.find(params[:id])

    if @work.update(trip_params)
      redirect_to work_path #movies/albums/books - list of all movies/albums/books
    else
      render "edit"
    end
  end

  def create(category)
    @work = Work.new work_params
    @work.category = category
    if @work.save
      redirect_to works_path
    else
      render "new"
    end
  end

  def destroy
    Work.destroy(params[:id])
    redirect_to works_path #movies/albums/books - list of all movies/albums/books
  end

  def upvote
    # if user is logged in
    if session[:user_id]
    # if this user didn't vote for it before
    # create new Vote
      @vote = Vote.create!(user_id: session[:user_id], work_id: params[:work_id])
      redirect_to :back
    # else flash you already voted for it
    else
      flash[:error] = "You must log in to do that"
      redirect_to :back
    end
  end

  private

  def work_params
    params.require(:work).permit(:title, :category, :description, :publication_year, :creator)
  end
end
