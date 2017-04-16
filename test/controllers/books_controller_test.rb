require "test_helper"

describe BooksController do
  it "should get index" do
    get books_path
    must_respond_with :success
  end

  it "should show the new book form" do
    get new_book_path
    must_respond_with :success
  end

  it "should create a new book" do
    proc {
      post books_path, params: { work:
        { title: "Sherlock Holmes",
          creator: "Conan Doyle",
          description: "Detective story"
        } }
    }.must_change 'Work.count', 1

  end

  it "should redirect to list after adding a book" do
    post books_path, params: { work:
      { title: "Much Ado About Nothing",
        creator: "William Shakespeare",
        description: "A play"
      } }
    must_respond_with :redirect
    must_redirect_to books_path
  end

  it "should show a flash if attempting to create a book with no title" do
    post books_path, params: { work:
      { title: "",
        creator: "Jane Austen",
        description: "A lot of romance"
      } }
    assert_equal "A problem occurred: Could not create book", flash[:error]
  end

  it "shouldn't create a new book if passing a book with no title" do
    assert_no_difference 'Work.count' do
      post books_path, params: { work:
        { title: "",
          creator: "Jane Austen",
          description: "A lot of romance"
        } }
    end
  end
end
