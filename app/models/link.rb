# == Schema Information
#
# Table name: links
#
#  id                 :integer          not null, primary key
#  user_id            :integer
#  url                :text
#  title              :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  cached_votes_score :integer          default("0")
#

class Link < ActiveRecord::Base
    belongs_to :user, counter_cache: true
	has_many :comments
	acts_as_votable
  
  def score
    self.get_upvotes.size - self.get_downvotes.size
  end
end
