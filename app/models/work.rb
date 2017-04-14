class Work < ApplicationRecord
  has_many :votes

  validates :category, inclusion: { in: %w(movie book album) }
  validates :title, presence: true
end
