class StringCalculator
  def self.add(input_string)
    puts "input string => #{input_string}"
    output = if input_string.empty?
               0
             else
               input_string.split(",").map(&:to_i).sum
             end
    puts "output value => #{output.to_i}"
    return output.to_i
  end
end
