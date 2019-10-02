# == Schema Information
#
# Table name: schools
#
#  id          :integer          not null, primary key
#  address     :string
#  contact     :string
#  description :text
#  email       :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

require 'test_helper'

class SchoolTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
