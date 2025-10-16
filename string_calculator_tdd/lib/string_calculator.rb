class StringCalculator
  def self.add(input_string)
    # puts "input string => #{input_string}"
    output = if input_string.empty?
               0
             else
               delimiters = [",", "\n", ";"]
               if input_string.start_with?("//")
                 delimiter_section, input_string = input_string.split("\n", 2)
                 delimiters += parse_delimiters(delimiter_section)
               end
               extracted_numbers = input_string.split(Regexp.union(delimiters.uniq)).map(&:to_i)
               negatives = extracted_numbers.select { |n| n < 0 }
               raise "negative numbers not allowed: #{negatives.join(', ')}" unless negatives.empty?

               extracted_numbers.sum
             end
    # puts "output value => #{output.to_i}"
    return output.to_i
  end

  private
  def self.parse_delimiters(delimiter_section)
    # delimiter_section looks like: //; OR //[***][%%]
    if delimiter_section.start_with?("//[")
      delimiter_section.scan(/\[([^\]]+)\]/).flatten
    else
      [delimiter_section[2]]
    end
  end
end
