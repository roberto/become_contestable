require File.dirname(__FILE__) + '/../config/test.rb'

class ContestTest < Test::Unit::TestCase
  fixtures :all
    
  def setup
    @contest = Contest.find(:first)
  end

  def test_associations
    assert_has_many @contest, :votes
    assert_has_many @contest, :nominations
  end
  
end

