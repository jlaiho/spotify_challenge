import itertools
import datetime

class BestBefore:

  def __init__(self):
    self.possible_dates = []
    
  def earliest_date(self, input):
    self.init_possible_dates(input) 
    if self.possible_dates:
      return min(self.possible_dates).strftime('%Y-%m-%d')
    else:
      return input + " is illegal"  
      
  def init_possible_dates(self, input):
    self.possible_dates = []
    date_parts = self.parse_input(input)
    for parts in map(lambda x: list(x), list(itertools.permutations(date_parts))):
      try:
        if parts[0] < 2000:
          parts[0] += 2000
        self.possible_dates.append(datetime.date(int(parts[0]), int(parts[1]), int(parts[2])))
      except: ValueError
    
  def parse_input(self, input):
    date_parts = input.split('/')
    try:
      date_parts = map(lambda x: int(x), date_parts)
    except ValueError:
      date_parts = []
    return date_parts

