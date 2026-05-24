class AddCounterCacheToLinks < ActiveRecord::Migration[7.2]
  def change
    add_column :links, :cached_votes_score, :integer, default: 0
    
    Link.find_each(&:update_cached_votes)
  end
end
