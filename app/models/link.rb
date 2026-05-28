class Link < ApplicationRecord
  belongs_to :user, counter_cache: true
  has_many :comments, dependent: :destroy
  acts_as_votable

  validates :title, presence: true
  validates :url, presence: true, format: { with: /\Ahttps?:\/\/.+/, message: "must start with http:// or https://" }

  def score
    get_upvotes.size - get_downvotes.size
  end
end
