require "test_helper"

describe Vote do
  let(:vote) { Vote.new }

  describe "validations" do
    it "You can create a vote" do
      vote = votes(:one)
      vote.valid?.must_equal true
    end

    it "Cannot create a vote without work or user" do
      vote.valid?.must_equal false
    end

    it "Cannot create a vote with just work" do
      vote = votes(:missing_user)
      vote.valid?.must_equal false
      vote.errors.messages.must_include :user
    end

    it "Cannot create a vote with just user" do
      vote = votes(:missing_work)
      vote.valid?.must_equal false
      vote.errors.messages.must_include :work
    end

    it "If a work and user are given the vote is valid" do
      vote = votes(:one)
      vote.valid?

      vote.errors.messages[:user].must_equal []
      vote.errors.messages[:work].must_equal []
    end

    it "User cannot vote for the same work twice" do
      vote1 = votes(:two)
      vote1.save.must_equal true

      vote.user = users(:user_two)
      vote.work = works(:besson)
      vote.save

      vote.valid?.must_equal false
      vote.errors.messages.must_include :user_id, "has already voted for this work"
    end
  end

  describe "relations" do
    it 'Can set the work through "work"' do
      work = works(:ursula)
      vote = votes(:two)

      vote.work = work

      vote.work_id.must_equal work.id
    end

    it 'Can set the work through "work_id"' do
      work = works(:goldman)
      vote = votes(:missing_work)

      vote.work_id = work.id

      vote.work.must_equal work
    end

    it 'Can set the user through "user"' do
      user = users(:user_two)
      vote = votes(:missing_user)

      vote.user = user

      vote.user_id.must_equal user.id
    end

    it 'Can set the user through "user_id"' do
      user = users(:user_one)
      vote = votes(:two)

      vote.user_id = user.id

      vote.user.must_equal user
    end
  end
end
