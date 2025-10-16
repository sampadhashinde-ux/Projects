class StringCalculator
  def self.add(input_string)
    puts "input string => #{input_string}"
    output = if input_string.empty?
               0
             else
               delimiters = [",", "\n", ";"]
               if input_string.start_with?("//")
                 delimiter_section, input_string = input_string.split("\n", 2)
                 delimiters += [delimiter_section[2]]
               end
               input_string.split(Regexp.union(delimiters.uniq)).map(&:to_i).sum
             end
    puts "output value => #{output.to_i}"
    return output.to_i
  end
end
