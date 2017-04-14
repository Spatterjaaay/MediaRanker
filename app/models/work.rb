class Work < ApplicationRecord
  has_many :votes

  validates :category, inclusion: { in: %w(movie book album) }
  validates :title, presence: true

  def self.top_ten_works(category)
    @works = Work.where(category: category).order(title: :desc)[0..10]
  end


end
