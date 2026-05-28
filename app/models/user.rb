class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, :email, uniqueness: true, presence: true

  has_many :links, dependent: :destroy
  has_many :comments, dependent: :destroy

  acts_as_voter
end
