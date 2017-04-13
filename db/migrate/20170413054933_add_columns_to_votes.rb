class AddColumnsToVotes < ActiveRecord::Migration[5.0]
  def change
    add_column :votes, :vote_date, :date
  end
end
