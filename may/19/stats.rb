require 'pry'

class Statistician
  def mean numbers
    sum_of_numbers = 0
    numbers.each do |n|
      # sum_of_numbers = sum_of_numbers + n
      sum_of_numbers += n
    end

    sum_of_numbers.to_f / numbers.count
  end
end

numbers = [1,2,5,7,9,1,1]

s = Statistician.new

binding.pry

puts "Mean: #{s.mean numbers}"
puts "Median: #{s.median numbers}"
puts "Mode: #{s.mode numbers}"