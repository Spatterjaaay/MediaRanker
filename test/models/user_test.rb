require "test_helper"

describe User do
  let(:user) { User.new }

  describe "validations" do
    it "Users require name" do
      user = users(:missing_name)
      user.valid?.must_equal false
      user.errors.messages.must_include :name
    end

    it "If a name is given the user is valid" do
      user = users(:user_two)
      user.valid?
      user.errors.messages[:name].must_equal []
    end

    it "You can create a user" do
      user = users(:user_one)
      user.valid?.must_equal true
    end
  end
end
