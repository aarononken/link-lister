class AddCommentCountToUser < ActiveRecord::Migration
  def change
    add_column :users, :comments_count, :integer, default: 0, null: false
    
    User.reset_column_information
    User.all.each do |u|
      User.reset_counters u.id, :comments
    end
  end
end
