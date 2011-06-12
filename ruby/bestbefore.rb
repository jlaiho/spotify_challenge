require 'date'

class BestBefore

  def initialize
    @possible_dates = []
  end
  
  def earliest_date(input)
    init_possible_dates(parse_input(input)) 
    return "#{input} is illegal" if @possible_dates.empty?
    return "#{@possible_dates.min}" 
  end
  
  protected
 
  def init_possible_dates(date_parts) 
    @possible_dates = []
    date_parts.permutation.to_a.each do |parts|
      begin
        parts[0] += 2000 if parts[0] < 2000
        date = Date.new(parts[0], parts[1], parts[2])
        @possible_dates << date
      rescue NoMethodError, ArgumentError => e
      end
    end
  end
  
  def parse_input(input)
    input.split('/').map {|part| part.to_i }    
  end

end

