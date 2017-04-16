require "test_helper"

describe WorksController do
  it "should get index" do
    get works_path
    must_respond_with :success
  end

  it "should get show" do
    get work_path(works(:aja).id)
    must_respond_with :success
  end

  it "should show 404 when work not found" do
    get work_path("stupid")
    must_respond_with :missing
  end

  it "should get edit" do
    get edit_work_path(works(:ursula).id)
    must_respond_with :success
  end

  it "should show a 404 when editing a work that doesn't exist" do
    get edit_work_path(1)
    must_respond_with :missing
  end

  it "should update a work" do
    patch work_path(works(:aja).id), params: { work: {title: "Wooow"} }

    work = Work.find(works(:aja).id)

    work.title.must_equal "Wooow"
  end

  it "should redirect to the corresponding list after updating" do
    patch work_path(works(:goldman).id), params: { work: {title: "Princess Bride 2"} }

    must_respond_with :redirect
    must_redirect_to movies_path
  end

  it "should show a flash if attempting to update work with no title" do
    patch work_path(works(:ursula).id), params: { work: { title: ""} }

    assert_equal "A problem occurred: Could not update book", flash[:error]
  end

  it "shouldn't change the database if no title present" do
    patch work_path(works(:goldman).id), params: { work: {title: ""} }

    work = Work.find(works(:goldman).id)

    work.title.must_equal "Princess Bride"
  end

  it "should show the new work form" do
    get new_work_path
    must_respond_with :success
  end

  it "should delete a work and redirect to the corresponding list" do
    delete work_path(works(:goldman).id)
    must_redirect_to movies_path
  end

# should test that I can upvote work only if logged in, and if user not logged in it shows a flash
# test upvote action
  def sign_in
    post login_path, params: { user_name: "User" }
  end

  it "should create a vote when a user upvotes" do
    sign_in
    proc {
      post upvote_path(works(:besson).id)
    }.must_change 'Vote.count', 1
  end

  it "should not create a vote when user tries to upvote same work twice" do
    sign_in
    post upvote_path(works(:ursula).id)
    proc {
      post upvote_path(works(:ursula).id)
    }.must_change 'Vote.count', 0
  end

  it "no vote added when upvote clicked when not logged in" do
    proc {
      post upvote_path(works(:goldman).id)
    }.must_change 'Vote.count', 0
  end
end
