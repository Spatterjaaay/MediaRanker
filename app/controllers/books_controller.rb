class BooksController < WorksController
  def index
    @books = Work.where(category: "book")
  end

  def create
    super("book")
  end
end
