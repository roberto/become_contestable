require File.dirname(__FILE__) + '/../config/test.rb'

class BecomeContestableTest < ActiveSupport::TestCase
  fixtures :all
  
  test "associations" do
    movie = movies(:one)
    assert_has_many movie, :votes
    assert_has_many movie, :nominations
  end
  
end
