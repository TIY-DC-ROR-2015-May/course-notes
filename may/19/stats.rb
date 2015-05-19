require 'pry'
require 'minitest/autorun'

class Statistician
  def mean numbers
    sum_of_numbers = 0
    numbers.each do |n|
      # sum_of_numbers = sum_of_numbers + n
      sum_of_numbers += n
    end

    sum_of_numbers.to_f / numbers.count
  end

  def simple_median numbers
    # [1,50,100,52]
    position = numbers.count / 2
    # numbers.sort[position]
    sorted_numbers = numbers.sort
    sorted_numbers[position]
  end
end

class StaticisticianTest < MiniTest::Test
  def test_mean_of_three_numbers
    s = Statistician.new
    assert_equal s.mean([5,10,15]), 10
  end

  def test_mean_of_two_numbers
    s = Statistician.new
    assert_equal s.mean([5,10]), 7.5
  end

  def test_median_sorted
    s = Statistician.new
    assert_equal s.simple_median([1,2,3,4,5]), 3
  end

  def test_median_unsorted
    s = Statistician.new
    assert_equal s.simple_median([3,2,5,1,4,1,10,100]), 4
  end

  def test_median_even
    s = Statistician.new
    assert_equal 52, s.simple_median([1,50,100,52])
  end
end

# numbers = [1,2,5,7,9,1,1]

# s = Statistician.new

# binding.pry

# puts "Mean: #{s.mean numbers}"
# puts "Median: #{s.simple_median numbers}"
# puts "Mode: #{s.mode numbers}"