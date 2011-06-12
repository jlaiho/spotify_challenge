require 'test/unit'
require 'bestbefore'

class TestBestBefore < Test::Unit::TestCase

  def setup
    @sut = BestBefore.new  
  end

  def test_earliest_date_with_valid_dates
    assert_equal('2067-02-04', @sut.earliest_date('02/4/67'))
    assert_equal('2002-04-07', @sut.earliest_date('02/4/7'))    
    assert_equal('2000-02-04', @sut.earliest_date('02/4/0'))
    assert_equal('2002-05-05', @sut.earliest_date('2002/5/5'))
    assert_equal('2005-05-05', @sut.earliest_date('5/5/5'))    
    assert_equal('2099-05-05', @sut.earliest_date('5/5/99'))
    assert_equal('2005-05-05', @sut.earliest_date('05/5/5'))
    assert_equal('2999-05-05', @sut.earliest_date('05/5/2999'))
    assert_equal('2000-05-05', @sut.earliest_date('05/5/2000'))
    assert_equal('2000-02-03', @sut.earliest_date('02/03/00'))
    assert_equal('2000-02-03', @sut.earliest_date('02/03/0')) 
    assert_equal('2001-02-03', @sut.earliest_date('1/2/3')) 
    assert_equal('2001-02-03', @sut.earliest_date('3/2/1'))            
  end
  
  def test_earliest_date_with_different_year_formats
    assert_equal('2000-02-03', @sut.earliest_date('02/03/0'))
    assert_equal('2000-02-03', @sut.earliest_date('02/03/00'))
    assert_equal('2000-02-03', @sut.earliest_date('02/03/2000'))
  end
  
  def test_leading_zeros_in_days
    assert_equal('2010-02-03', @sut.earliest_date('02/03/2010'))
    assert_equal('2010-02-03', @sut.earliest_date('02/3/2010'))
  end
  
  def test_leading_zeros_in_months
    assert_equal('2010-02-03', @sut.earliest_date('2/03/2010'))
    assert_equal('2010-02-03', @sut.earliest_date('02/03/2010'))
  end
  
  def test_earliest_date_wtih_invalid_dates
    assert_equal('31/9/73 is illegal',  @sut.earliest_date('31/9/73'))
    assert_equal('31/2/73 is illegal',  @sut.earliest_date('31/2/73')) 
    assert_equal('20/20/20 is illegal', @sut.earliest_date('20/20/20')) 
    assert_equal('3/2/ is illegal',     @sut.earliest_date('3/2/'))
    assert_equal('3/2 is illegal',      @sut.earliest_date('3/2'))
    assert_equal('321 is illegal',      @sut.earliest_date('321'))
    assert_equal(' is illegal',         @sut.earliest_date(''))
  end
  
end

