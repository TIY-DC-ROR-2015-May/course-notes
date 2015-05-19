require 'pry'
require 'minitest/autorun'

class Statistician
  def initialize given_name=nil
    @stored_name = given_name
    @computes    = 0
  end

  def name
    @stored_name
  end

  def sum numbers
    sum_of_numbers = 0
    numbers.each do |n|
      # sum_of_numbers = sum_of_numbers + n
      sum_of_numbers += n
    end
    sum_of_numbers
  end

  def mean nums
    @computes += 1
    # sum_of_numbers = 0
    # numbers.each do |n|
    #   # sum_of_numbers = sum_of_numbers + n
    #   sum_of_numbers += n
    # end
    sum(nums).to_f / nums.count
  end

  def simple_median numbers
    # [1,50,100,52]
    position = numbers.count / 2
    # numbers.sort[position]
    sorted_numbers = numbers.sort
    sorted_numbers[position]
  end

  def mode numbers
    @computes += 1
    winner = numbers.first
    winning_score = 0
    numbers.each do |n|
      score = numbers.count(n)
      if score > winning_score
        winner = n
        winning_score = score
      end
    end
    winner
  end

  def computations_performed
    @computes
  end
end

class StaticisticianTest < MiniTest::Test
  def test_history_tracking
    s = Statistician.new
    assert_equal 0, s.computations_performed
    13.times do
      s.mean [2,4]
    end
    assert_equal 13, s.computations_performed
  end

  def test_names
    s = Statistician.new "Alice"
    t = Statistician.new "Bob"
    assert_equal "Alice", s.name
    assert_equal "Bob",   t.name
  end

  def test_sum_of_numbers
    s = Statistician.new
    assert_equal 30, s.sum([5,10,15])
  end

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

  def test_mode_lots
    s = Statistician.new
    assert_equal 1, s.mode([1,2,5,7,9,1,1])
  end

  def test_mode_little
    s = Statistician.new
    is_2 = s.mode([4,2,3,2,3]) == 2
    is_3 = s.mode([4,2,3,2,3]) == 3
    assert(is_2 || is_3)
  end
end

# numbers = [1,2,5,7,9,1,1]

# s = Statistician.new

# binding.pry

# puts "Mean: #{s.mean numbers}"
# puts "Median: #{s.simple_median numbers}"
# puts "Mode: #{s.mode numbers}"