require "test_helper"

describe AlbumsController do
  it "should get index" do
    get albums_path
    must_respond_with :success
  end

  it "should show the new album form" do
    get new_album_path
    must_respond_with :success
  end

  it "should create a new albums" do
    proc {
      post albums_path, params: { work:
        { title: "Poodle Hat",
          creator: "Weird Al",
          description: "Silly songs"
        } }
    }.must_change 'Work.count', 1

  end

  it "should redirect to list after adding an album" do
    post albums_path, params: { work:
      { title: "Running with Scissors",
        creator: "Weird Al",
        description: "More sily songs"
      } }
    must_respond_with :redirect
    must_redirect_to albums_path
  end

  it "should throw an error if attempting to create an album with no title" do
    post albums_path, params: { work:
      { title: "",
        creator: "Rage Against the Machine",
        description: "Alternative"
      } }
    assert_equal "A problem occurred: Could not create album", flash[:error]
  end

  it "shouldn't create a new album if passing an album with no title" do
    assert_no_difference 'Work.count' do
      post books_path, params: { work:
        { title: "",
          creator: "NIN",
          description: "Music"
        } }
    end
  end
end
