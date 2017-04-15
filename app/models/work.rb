class Work < ApplicationRecord
  has_many :votes, dependent: :destroy

  validates :category, inclusion: { in: %w(movie book album) }
  validates :title, presence: true

  def self.top_ten_works(category)
      where(category: category).order(votes_count: :desc).limit(10)
  end

  def self.spotlight
      all.order(votes_count: :desc).first
  end

end
