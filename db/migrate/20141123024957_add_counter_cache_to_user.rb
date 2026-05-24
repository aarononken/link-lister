class AddCounterCacheToUser < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :links_count, :integer, default: 0, null: false
    
    User.reset_column_information
    User.all.each do |u|
      User.reset_counters u.id, :links
    end
  end
end
