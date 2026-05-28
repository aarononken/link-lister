class Comment < ApplicationRecord
  validates :body, presence: true
  belongs_to :link
  belongs_to :user, counter_cache: true
end
