class Different

  class << self
  
    def abs_differences(input)
      differences = []
      numbers = parse_input(input)
      numbers.pop if numbers.size % 2 != 0
      numbers.each_slice(2) {|s| differences << (s[0] - s[1]).abs }
      return differences
    end

    def parse_input(input)
      input.split(/\s/).delete_if {|el| el.empty? }.collect {|el| el.to_i }
    end
  
  end

end

