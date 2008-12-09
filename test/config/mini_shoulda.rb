class Test::Unit::TestCase
  
  def assert_has_many(model, association)
    assert_association(model, association, :has_many)
  end
  
  def assert_association(model, association, macro_expected)
    associaton = model.class.reflect_on_association(association.to_sym)
    assert_not_nil associaton, "association #{association} not found"
    assert_equal associaton.macro, macro_expected.to_sym
  end
  
end