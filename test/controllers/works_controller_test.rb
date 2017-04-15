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

  it "should show 404 when book not found" do
    get work_path("stupid")
    must_respond_with :missing
  end
end

#
#     it "should show the new book form" do
#       get new_book_path
#       must_respond_with :success
#     end
#
#     it "should redirect to list after adding book" do
#       # strong params also applies to these params
#       # if we are creating a new object, we need to create it with params
#       # look at strong params to help us write the hash
#       post books_path, params: { book:
#         { title: "Testing",
#           author_id: authors(:metz).id,
#           isbn: rand(10..50),
#           description: "Whatever"
#         } }
#       must_redirect_to books_path
#     end
#
#     it "should affect the model when creating a book" do
#       proc {
#         post books_path, params: { book:
#           { title: "Testing",
#             author_id: authors(:metz).id,
#             isbn: rand(10..50),
#             description: "Whatever"
#           } }
#       }.must_change 'Book.count', 1
#     end
#
#     it "should delete a book and redirect to book list" do
#       delete book_path(books(:poodr).id)
#       must_redirect_to books_path
#     end
#
#     it "should get edit" do
#       # in parens(the file name of the fixtures, which is books,
#       # the name of the fixture, which is :poodr, and then grabbing it's id
#       get edit_book_path(books(:poodr).id)
#       must_respond_with :success
#     end
#
# end
