class BooksController < WorksController
  def index
    @books = Works.where(category: "book")
  end

  def create
    super("book")
  end
end
