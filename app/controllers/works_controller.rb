class WorksController < ApplicationController
  def index
    @works = Works.all
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

  # def create(category)
  #   @work = Work.create work_params category
  #   if @work.id != nil
  #     redirect_to works_path
  #   else
  #     render "new"
  #   end
  # end

  ###########Book controller

  # def create
  #   super("book")
  # end

  def destroy
    Work.destroy(params[:id])
    redirect_to works_path #movies/albums/books - list of all movies/albums/books
  end

  private

  def work_params
    params.require(:work).permit(:title, :category, :description, :publication_year, :creator)
  end
end
