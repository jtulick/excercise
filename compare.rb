# File: compare.rb

# Returns a boolean value comparing the value difference between all elements
# in two arrays (first_array, second_array) if they are within a specified range
# of eachother (context_index)
def array_test(first_array, second_array, context_index)
  return false if first_array.empty? or second_array.empty?
  first_array.each do |first_term|
    second_array.each do |second_term|
      term_separation = first_term - second_term
      puts term_separation.abs
      return true if term_separation.abs <= context_index
    end
  end
  false
end
