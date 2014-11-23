class AddCounterCacheToLinks < ActiveRecord::Migration
  def change
    add_column :links, :cached_votes_score, :integer, default: 0
    
    Link.find_each(&:update_cached_votes)
  end
end
