require File.dirname(__FILE__) + '/../config/test.rb'

class Test::Unit::TestCase
  
  def assert_has_many(model, association)
    if associaton = model.class.reflect_on_association(association.to_sym)
      assert associaton.macro, :has_many
    else
      add_error("contest doesn't has many votes")
    end
  end
  
end


class ContestTest < Test::Unit::TestCase
  fixtures :all
    
  def setup
    @contest = contests(:one)
  end

  def test_associations
    assert @contest.respond_to?(:votes)
    assert @contest.respond_to?(:nominations)
    assert_has_many @contest, :votes
  end
  
end

