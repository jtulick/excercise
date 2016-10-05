# File: context_comparison.rb

require_relative "compare"
require_relative "parse_text"
require_relative "check_files"
#Read in the required variables
puts "Enter the directory to search: "
directory_to_search = gets.chomp
if Dir.exists?(directory_to_search)
else
  puts "Directory " + directory_to_search + " does not exist.  Please enter the directory to search: "
  directory_to_search = gets.chomp
end

puts "Enter the first search term: "
first_search_term = gets.chomp
puts "Enter the second search term: "
second_search_term = gets.chomp
puts "Enter the context variable (e.g., the terms must be no more than N words apart): "
context_words_separation = gets.chomp.to_i

#Read contents of the directory
directory_contents = Dir.entries(directory_to_search)

text_files_in_directory = []  #initalize array

#find all text files in the specified directory
directory_contents.each do |file_in_directory|
  String.try_convert(file_in_directory)
  if file_in_directory.end_with? ".txt"
    text_files_in_directory << file_in_directory
  end
end

parsed_files = []
text_files_in_directory.each do |text_file|
  full_file_path = directory_to_search + "/" + text_file
  parsed_files << parse_text(full_file_path, first_search_term.downcase, second_search_term.downcase)
end

file_check_results = check_files(parsed_files)
puts file_check_results
p file_check_results
puts directory_to_search
puts first_search_term
puts second_search_term
puts context_words_separation
