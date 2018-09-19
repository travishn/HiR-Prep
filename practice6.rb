  # Maybe Zeroes

# You are given an array of numbers, and a boolean.

# Write a method that will remove all the zeroes from the numbers if
# drop is true and then add the numbers with the zeroes removed and
# return this sum. If drop is false then add the given numbers and
# return the sum.

def maybe_zeroes(numbers, drop)
  if drop
    numbers.map { |num| remove_zeroes(num) }.reduce(:+)
  else
    numbers.reduce(:+)
  end
end

def remove_zeroes(num)
  result = ''
  num.to_s.each_char do |num|
    result += num if num != '0'
  end

  result.to_i
end

puts "-------Maybe Zeroes-------"

puts maybe_zeroes([100, 505, 9, 1002], true) == 77
puts maybe_zeroes([100, 505, 9, 1002], false) == 1616
puts maybe_zeroes([9000103, 43], true) == 956
puts maybe_zeroes([43, 7, 98], false) == 148


# Letter Swap

# You are given a sentence and an array of 2 letters

# Write a method that will return the sentence with any instance of
# the first letter switched with the second letter and vice versa.
# It should treat capitalized or lowercase letters the same.


def swap_letters(sentence, letters)
  sentence.each_char.with_index do |letter, idx|
    if letter.downcase === letters[0].downcase
      sentence[idx] = letters[1].downcase
    elsif letter.downcase === letters[1].downcase
      sentence[idx] = letters[0].downcase
    end
  end

  sentence
end

puts "-------Letter Swap--------"
puts swap_letters("I went to the dentist", ["n", "t"]) == "I wetn no nhe detnisn"
puts swap_letters("I went to the dentist", ["t", "n"]) == "I wetn no nhe detnisn"
puts swap_letters("My name is Michael", ["a", "m"]) == "ay nmae is aichmel"
puts swap_letters("My name is Michael", ["A", "m"]) == "ay nmae is aichmel"


# Transpose

# You are given a n * n 2D matrix

# Example:
# Matrix = [[1, 2],
# 					[3, 4]]

# Write a method that will transpose a matrix. The transpose of a matrix is
# obtained by turning all of the columns of a matrix into the rows and vice versa.
# So an element at index ij would be at index ji once tranposed.
# For example:
# transpose(Matrix) = [[1, 3],
#     								[2, 4]]
# You may assume a square matrix as input. Do not use `.transpose`
def transpose(matrix)
  result = Array.new(matrix[0].length) { [] }

  i = 0
  while i < matrix[0].length
    matrix.each do |row|
      result[i] << row[i]
    end

    i += 1
  end

  result
end



puts "-------Transpose-------"
matrix_one = [[1, 2],
							[3, 4]]
matrix_two = [[1, 4, 7],
 							[2, 5, 8],
							[3, 6, 9]]
matrix_three = [[1, 2, 3, 4],
							 	[5, 6, 7, 8],
  						  [9, 10, 11, 12],
							  [13, 14, 15, 16]]
puts transpose(matrix_one) == [[1, 3],
 															 [2, 4]]
puts transpose(matrix_two) == [[1, 2, 3],
														   [4, 5, 6],
															 [7, 8, 9]]
puts transpose(matrix_three) == [[1, 5, 9, 13],
 																	 [2, 6, 10, 14],
																	 [3, 7, 11, 15],
																	 [4, 8, 12, 16]]
																	 
																	 
# Calculater

# You are given a hash with letters as keys and mathematical operators as values,
# an input array of numbers and letters, and a starting value

# Write a method that takes the start value then goes through the input array
# performing the operation on the accumulated output up until that point
# and the next number in the array. If a letter in the input does not appear in
# the hash, skip it and the number after it

# Example:
# hash = {"a" => "+", "z" => "*", "t" => "/"}
# input = ["z", 5, "t", 8]
# start = 9

# calculater(hash, input, start) = 5 (remember integer division!)
#start = 8 *(which was z value) 5 /(which was t value) 8


def calculater(hash, input, start)
  input.each_with_index do |letter, idx|
    next if idx == input.length - 1

    if hash[letter] == '+'
      start += input[idx+1]
    elsif hash[letter] == '*'
      start *= input[idx+1]
    elsif hash[letter] == '/'
      start /= input[idx+1]
    elsif hash[letter] == '-'
      start -= input[idx+1]
    end
  end

  start
end


puts "---------Calculater---------"

hash = {"a" => "+", "z" => "*", "t" => "/"}
hash2 = { "y" => "*", "r" => "/", "u" => "-"}
puts calculater(hash, ["z", 5, "t", 8], 9) == 5
puts calculater(hash, ["z", 5, "z", 3], 3) == 45
puts calculater(hash2, ["a", 5, "y", 7, "r", 9, "u", 4], 8) == 2
puts calculater(hash2, ["y", 5, "u", 20, "r", 9, "y", 4], 0) == -12

