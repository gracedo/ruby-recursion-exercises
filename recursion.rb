# Takes a start and an end and returns an array of all numbers between
def range(start,finish)
  if start > finish
    return []
  elsif start == finish
    return [start]
  else
    return [start] + range(start+1, finish)
  end
end

# p range(1,6) # => [1,2,3,4,5,6]


# Sum of an array
def sum(arr)
  return arr[0] if arr.length == 1
  return arr[0] + sum(arr.drop(1))
end

# p sum([1,2,3,4,5]) # => 15


# Exponentiation (2 versions)
def exp_1(num, exp)
  return 1 if exp == 0

  return num * exp_1(num, exp - 1)
end

# p exp_1(2,3) # => 8
# p exp_1(3,3) # => 27
# p exp_1(2,4) # => 16

def exp_2(b, n)
  return 1 if n == 0

  if n % 2 == 0 # even
    return exp_2(b,n/2) ** 2
  else
    return b * (exp_2(b, (n-1) / 2) ** 2)
  end
end

# p exp_2(2,3) #8
# p exp_2(3,3) #27
# p exp_2(2,4) #16


# Perform a "deep" duplication of the interior arrays
def deep_dup(arr)
  arr.map { |e| e.is_a?(Array) ? deep_dup(e) : e }
end

# p deep_dup([1, [2], [3, [4]]]) # => [1, [2], [3, [4]]]


# Fibonacci of first "n" numbers in an array
def fib(n)
  return[] if n == 0
  return [0] if n == 1
  return [0,1] if n == 2

  fibs = fib(n-1)
  fibs << fibs[-1] + fibs[-2]
end

# p fib(5) # => [0, 1, 1, 2, 3]


# Binary search
def bsearch(array, target)
  return nil if array.empty?

  mid_point = array.length / 2

  if array[mid_point] == target
    return mid_point
  elsif target < array[mid_point]
    return bsearch(array.take(mid_point), target)
  else
    return bsearch(array.drop(mid_point), target) + mid_point
  end
end

# p bsearch([1,2,3,4,5,6,7], 2) # => 1


# RubyQuiz's Make Change problem
def make_change(amt, coins)
  return [] if amt == 0

  best = nil

  coins.each do |c|
    next if c > amt
    attempt = make_change(amt - c, coins) + [c]
    if best.nil?
      best = attempt
    elsif attempt.length < best.length
      best = attempt
    end
  end

  return best
end

# p make_change(39, [25,10,5,1]) # => [1, 1, 1, 1, 10, 25]


# Merge-sort algorithm
def merge_sort(arr)
  return arr if arr.length < 2

  arr1 = merge_sort(arr.take(arr.length/2))
  arr2 = merge_sort(arr.drop(arr.length/2))

  return merge(arr1,arr2)
end

def merge(arr1,arr2)
  final = []

  until arr1.empty? or arr2.empty?
    if arr1[0] < arr2[0]
      final << arr1.shift
    else
      final << arr2.shift
    end
  end

  final + arr1 + arr2
end

# p merge_sort([2,5,3,6,3,1,5,3,5,1,6]) # => [1, 1, 2, 3, 3, 3, 5, 5, 5, 6, 6]


# Returns all subsets of an array
def subsets(arr)
  return [[]] if arr.empty?

  new_arr = subsets(arr.take(arr.length-1))

  out_arr = []
  new_arr.each do |a|
    out_arr << a
    out_arr << a + [arr.last]
  end

  out_arr
end

# p subsets([1, 2, 3]) # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]