require "test_helper"

describe MoviesController do
  it "should get index" do
    get movies_path
    must_respond_with :success
  end

  it "should show the new movie form" do
    get new_movie_path
    must_respond_with :success
  end

  it "should create a new movie" do
    proc {
      post movies_path, params: { work:
        { title: "Fifth Element",
          creator: "Luc Besson",
          description: "Sci-fi story"
        } }
    }.must_change 'Work.count', 1

  end

  it "should redirect to list after adding a movie" do
    post movies_path, params: { work:
      { title: "Galaxy Quest",
        description: "Awesome space movie"
      } }
    must_respond_with :redirect
    must_redirect_to movies_path
  end

  it "should throw an error if attempting to create a movie with no title" do
    post movies_path, params: { work:
      { title: "",
        creator: "Steven Spielberg",
        description: "Sci-fi movie about aliens"
      } }
    assert_equal "A problem occurred: Could not create movie", flash[:error]
  end

  it "shouldn't create a new movie if passing a movie with no title" do
    assert_no_difference 'Work.count' do
      post books_path, params: { work:
        { title: "",
          creator: "George Lucas",
          description: "Lightsabers!"
        } }
    end
  end
end
