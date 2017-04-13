class VoteToWorkRelationship < ActiveRecord::Migration[5.0]
  def change
    add_reference :votes, :work, foreign_key: true
  end
end
