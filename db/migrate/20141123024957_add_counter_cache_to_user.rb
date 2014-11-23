class AddCounterCacheToUser < ActiveRecord::Migration
  def change
    add_column :users, :links_count, :integer, default: 0, null: false
    
    User.reset_column_information
    User.all.each do |u|
      User.reset_counters u.id, :links
    end
  end
end
