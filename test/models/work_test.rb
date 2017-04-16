require "test_helper"

describe Work do
  let(:work) { Work.new }

  describe "validations" do
    it "Works require title" do
      work = works(:missing_title)
      work.valid?.must_equal false
      work.errors.messages.must_include :title
    end

    it "If a title is given the work is valid" do
      work = works(:aja)
      work.valid?
      work.errors.messages[:title].must_equal []
    end

    it "Works require category" do
      work = works(:missing_category)
      work.valid?.must_equal false
      work.errors.messages.must_include :category
    end

    it "Work requires correct category" do
     work = works(:wrong_category)
     work.valid?.must_equal false
     work.errors.messages.must_include :category, "Category must be either book, movie or album"
   end

    it "If a category is given the work is valid" do
      work = works(:besson)
      work.valid?
      work.errors.messages[:category].must_equal []
    end

    it "You can create a work" do
      work = works(:goldman)
      work.valid?.must_equal true
    end
  end

  describe "top_ten_works" do
    it "confirms that work at the top is the one with most votes in its category" do
      movies = Work.top_ten_works("movie")

      movies.first.title.must_equal "Princess Bride"
    end

    it "displays only 10 works if more" do
      albums = Work.top_ten_works("album")
      albums.length.must_equal 10
    end

    it "displays all if there are less than 10 works total" do
      movies = Work.top_ten_works("movie")
      movies.length.must_equal 2
    end

    it "displays work of correct cateogory" do
      movies = Work.top_ten_works("movie")

      movies.first.category.must_equal "movie"
      movies.last.category.must_equal "movie"
    end

    it "returns empty array if there no work of a particular category" do
      works(:ursula).destroy
      books = Work.top_ten_works("books")

      books.must_equal []
    end
  end

  # describe "spotlight" do
  #   it "returns work with the most votes over all" do
  #     work = works(:lee)
  #     user = User.create(name: "ken")
  #     vote = Vote.create(user_id: user.id, work_id: work.id)
  #     Work.spotlight.must_equal work
  #   end
  #
  #   it "can return a random work object when there's no votes" do
  #     Work.spotlight.wont_be_nil
  #     Work.spotlight.class.must_equal Work
  #   end
  # end
end
