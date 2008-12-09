require File.dirname(__FILE__) + '/../config/test.rb'

class ActsAsVoterTest < ActiveSupport::TestCase
  fixtures :all

  test "associations" do
    user = users(:one)
    assert_has_many user, :votes
  end

end
