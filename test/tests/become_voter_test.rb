require File.dirname(__FILE__) + '/../config/test.rb'

class BecomeVoterTest < ActiveSupport::TestCase
  fixtures :all

  test "associations" do
    user = users(:one)
    assert_has_many user, :votes
  end
  
  test "added methods" do
    
  end

end