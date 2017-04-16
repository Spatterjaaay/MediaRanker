require "test_helper"

describe UsersController do
  it "should get index" do
    get users_path
    must_respond_with :success
  end

  it "should get show" do
    get user_path(users(:user_two).id)
    must_respond_with :success
  end

  it "should show 404 when user not found" do
    get user_path("stupid")
    must_respond_with :missing
  end

end
