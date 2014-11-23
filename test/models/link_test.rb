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

require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
