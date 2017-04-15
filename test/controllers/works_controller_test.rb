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

  it "should show a flash if atempting to update work with no title" do
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
    delete book_path(works(:goldman).id)
    must_redirect_to movies_path
  end
end



#
#     it "should get edit" do
#       # in parens(the file name of the fixtures, which is books,
#       # the name of the fixture, which is :poodr, and then grabbing it's id
#       get edit_book_path(books(:poodr).id)
#       must_respond_with :success
#     end
#
# end
