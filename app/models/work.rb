class Work < ApplicationRecord
  validates :category, inclusion: { in: %w(movie book album) }
  validates :title, presence: true
end
