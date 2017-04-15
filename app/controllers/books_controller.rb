class BooksController < WorksController
  def index
    @books = Work.where(category: "book").order(votes_count: :desc)
  end

  def new
    super
    @path = books_path
  end

  def create
    super("book")
  end
end
