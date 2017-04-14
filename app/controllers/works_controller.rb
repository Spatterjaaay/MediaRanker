class WorksController < ApplicationController
  def index
    @sorted_books = Work.top_ten_works("book")
    @sorted_albums = Work.top_ten_works("album")
    @sorted_movies = Work.top_ten_works("movie")
  end

  def show
    @result_work = Work.find(params[:id])
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    @work = Work.find(params[:id])

    if @work.update(work_params)
      flash[:success] = "Successfully updated #{@work.category} #{ @work.id }"
      if @work.category == "book"
        redirect_to books_path
      elsif @work.category == "album"
        redirect_to albums_path
      else
        redirect_to movies_path
      end
    else
      flash.now[:error] = "A problem occurred: Could not update #{ @work.category }"
      render "edit"
    end
  end

  def new
    @work = Work.new
  end

  def create(category)
    @work = Work.new work_params
    @work.category = category
    if @work.save
      flash[:success] = "Successfully created #{category} #{ @work.id }"
      if @work.category == "book"
        redirect_to books_path
      elsif @work.category == "album"
        redirect_to albums_path
      else
        redirect_to movies_path
      end
    else
      flash.now[:error] = "A problem occurred: Could not create #{category}"
      render "new"
      return
    end
  end

  def destroy
    @work = Work.destroy(params[:id])
    flash[:success] = "Successfully destroyed #{@work.category} #{ @work.id }"
    if @work.category == "book"
      redirect_to books_path
    elsif @work.category == "album"
      redirect_to albums_path
    else
      redirect_to movies_path
    end
  end

  def upvote
    if session[:user_id]
    @vote = Vote.create(user_id: session[:user_id], work_id: params[:work_id])
      if @vote.id
        flash[:success] = "Successfully upvoted!"
        redirect_back(fallback_location: root_path)
      else
        flash.now[:error] = "Could not upvote"
        @result_work = Work.find(params[:work_id])
        render "show"
      end
    else
      flash[:error] = "You must log in to do that"
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def work_params
    params.require(:work).permit(:title, :category, :description, :publication_year, :creator)
  end
end
