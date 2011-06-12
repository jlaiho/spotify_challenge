import unittest
from bestbefore import BestBefore

class TestBestBefore(unittest.TestCase):

  def setUp(self):
    self.sut = BestBefore()
    
  def test_earliest_date_with_valid_dates(self):
    self.assertEquals('2067-02-04', self.sut.earliest_date('02/4/67'))
    self.assertEquals('2002-04-07', self.sut.earliest_date('02/4/7'))   
    self.assertEquals('2067-02-04', self.sut.earliest_date('02/4/67'))
    self.assertEquals('2002-04-07', self.sut.earliest_date('02/4/7'))    
    self.assertEquals('2000-02-04', self.sut.earliest_date('02/4/0'))
    self.assertEquals('2002-05-05', self.sut.earliest_date('2002/5/5'))
    self.assertEquals('2005-05-05', self.sut.earliest_date('5/5/5'))    
    self.assertEquals('2099-05-05', self.sut.earliest_date('5/5/99'))
    self.assertEquals('2005-05-05', self.sut.earliest_date('05/5/5'))
    self.assertEquals('2999-05-05', self.sut.earliest_date('05/5/2999'))
    self.assertEquals('2000-05-05', self.sut.earliest_date('05/5/2000'))
    self.assertEquals('2000-02-03', self.sut.earliest_date('02/03/00'))
    self.assertEquals('2000-02-03', self.sut.earliest_date('02/03/0')) 
    self.assertEquals('2001-02-03', self.sut.earliest_date('1/2/3')) 
    self.assertEquals('2001-02-03', self.sut.earliest_date('3/2/1'))
    
  def test_earliest_date_with_different_year_formats(self):
    self.assertEquals('2000-02-03', self.sut.earliest_date('02/03/0'))
    self.assertEquals('2000-02-03', self.sut.earliest_date('02/03/00'))
    self.assertEquals('2000-02-03', self.sut.earliest_date('02/03/2000'))
  
  def test_leading_zeros_in_days(self):
    self.assertEquals('2010-02-03', self.sut.earliest_date('02/03/2010'))
    self.assertEquals('2010-02-03', self.sut.earliest_date('02/3/2010'))
  
  def test_leading_zeros_in_months(self):
    self.assertEquals('2010-02-03', self.sut.earliest_date('2/03/2010'))
    self.assertEquals('2010-02-03', self.sut.earliest_date('02/03/2010'))
    
  def test_earliest_date_wtih_invalid_dates(self):
    self.assertEquals('31/9/73 is illegal',  self.sut.earliest_date('31/9/73'))
    self.assertEquals('31/2/73 is illegal',  self.sut.earliest_date('31/2/73')) 
    self.assertEquals('20/20/20 is illegal', self.sut.earliest_date('20/20/20')) 
    self.assertEquals('3/2/ is illegal',     self.sut.earliest_date('3/2/'))
    self.assertEquals('3/2 is illegal',      self.sut.earliest_date('3/2'))
    self.assertEquals('321 is illegal',      self.sut.earliest_date('321'))
    self.assertEquals(' is illegal',         self.sut.earliest_date(''))

if __name__ == '__main__':
    unittest.main()

