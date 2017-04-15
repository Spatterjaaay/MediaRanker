class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :work
  belongs_to :work, counter_cache: true
  
  validates :user_id, uniqueness: { scope: :work_id, message: 'has already voted for this work' }
end
