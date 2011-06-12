require 'test/unit'
require 'different'

class TestDifferent < Test::Unit::TestCase

  def setup
    @sut = Different  
  end 
  
  def test_differences
    input = '10   12
    1871293781758123
        72784
      1
      9223372036854775807' 
    assert_equal([2, 1871293781685339, 9223372036854775806], @sut.abs_differences(input))
  end
  
  def test_differences2
    input = '1 
      
      6' 
    assert_equal([5], @sut.abs_differences(input))
  end
  
  def test_differences3
    input = '4
    5' 
    assert_equal([1], @sut.abs_differences(input))
  end
    
  def test_differences_with_uneven_count_of_numbers
    input = '5 2 422     ' 
    assert_equal([3], @sut.abs_differences(input))
  end
  
  def test_differences_with_only_whitespaces
    input = '   ' 
    assert_equal([], @sut.abs_differences(input))
  end
  
  def test_differences_with_empty_string
    input = '' 
    assert_equal([], @sut.abs_differences(input))
  end
  
  def test_differences_with_only_line_breaks
    input = '
    
    
    ' 
    assert_equal([], @sut.abs_differences(input))
  end
  
end

