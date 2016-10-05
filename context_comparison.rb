# File: context_comparison.rb

require_relative "compare"
require_relative "parse_text"
require_relative "formatter"
#Read in the required variables
input_variables = Output_formatter.request_inputs
puts Output_formatter.notification_confirmation(*input_variables)

#read contents of directory
directory_contents = Dir.entries(input_variables[0])

#initalize required arrays
text_files_in_directory = []
parsed_files = []
context_files_found = []

#find all text files in the specified directory
directory_contents.each do |file_in_directory|
  String.try_convert(file_in_directory)
  if file_in_directory.end_with? ".txt"
    text_files_in_directory << file_in_directory
  end
end

text_files_in_directory.each do |text_file|
  full_file_path = input_variables[0] + "/" + text_file
  parsed_files << parse_text(full_file_path, input_variables[1].downcase, input_variables[2].downcase)
end

parsed_files.each do |file|
  if array_test(file[1], file[2], input_variables[3])
    context_files_found << file[0]
  end
end

if context_files_found.empty?
  puts "No matching files were found."
else
  puts Output_formatter.results_formatter(context_files_found, *input_variables)
end
