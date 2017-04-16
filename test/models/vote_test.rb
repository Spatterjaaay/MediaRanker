require "test_helper"

describe Vote do
  let(:vote) { Vote.new }

  describe "validations" do
    it "You can create a vote" do
      vote = votes(:one)
      vote.valid?.must_equal true
    end

  end
end
