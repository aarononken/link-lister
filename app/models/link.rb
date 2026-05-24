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

class Link < ApplicationRecord
  belongs_to :user, counter_cache: true
  has_many :comments, dependent: :destroy
  acts_as_votable

  validates :title, presence: true
  validates :url, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), message: "must be a valid URL" }

  def score
    get_upvotes.size - get_downvotes.size
  end
end
