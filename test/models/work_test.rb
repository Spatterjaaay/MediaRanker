require "test_helper"

describe Work do
  let(:work) { Work.new }

  describe "validations" do
    it "Works require title" do
      work = works(:missing_title)
      work.valid?.must_equal false
      work.errors.messages.must_include :title
    end

    it "If a title is given the work is valid" do
      work = works(:aja)
      work.valid?
      work.errors.messages[:title].must_equal []
    end

    it "Works require category" do
      work = works(:missing_category)
      work.valid?.must_equal false
      work.errors.messages.must_include :category
    end

    it "Work requires correct category" do
     work = works(:wrong_category)
     work.valid?.must_equal false
     work.errors.messages.must_include :category, "Category must be either book, movie or album"
   end

    it "If a category is given the work is valid" do
      work = works(:besson)
      work.valid?
      work.errors.messages[:category].must_equal []
    end

    it "You can create a work" do
      work = works(:goldman)
      work.valid?.must_equal true
    end
  end
end
