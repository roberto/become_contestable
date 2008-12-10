require File.dirname(__FILE__) + '/../config/test.rb'

class BecomeContestTest < ActiveSupport::TestCase
  fixtures :all

  test "associations" do
    contest = voting_contests(:one)
    assert_has_many contest, :votes
  end
  
  test "added methods" do
    
  end

end