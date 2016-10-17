# File: exercise.rb
require_relative 'parse_text'
require_relative 'formatter'
require_relative 'comparison'
require 'trollop'

opts = Trollop.options do
  version 'Stelligent Exercise 0.1.0'
  banner <<-EOS
This program will return a list of files in a given directory where 2 search
terms are not more than N words apart.

Usage:
      exercise [options]
where [options] are:
EOS

  opt :directory, 'Required - The directory to search', required: true, type: String
  opt :termone, 'Required - The first search term', required: true, type: String
  opt :termtwo, 'Required - The second search term', required: true, type: String
  opt :context, 'Required - The desired maximum distance between search terms', required: true, type: Integer
end
Trollop.die :directory, "#{opts[:directory]} is not a valid directory" unless Dir.exist?(opts[:directory])

text_files = []
all_text_files = []

folder_contents = Dir.entries(opts[:directory])
folder_contents.each do |file|
  text_files << file if Comparison.is_text?(file)
end

abort("No text files found in #{opts[:directory]}") if text_files == []
text_files.map! { |file| "#{opts[:directory]}/#{file}" }
text_files.each do |file|
  all_text_files << Files.new(File.basename(file), File.expand_path(file))
end

all_text_files.each do |file|
  file.find_words?(opts[:termone], opts[:termtwo])
end

all_text_files.each do |file|
  file.term_one_locations.each do |term_one|
    file.term_two_locations.each do |term_two|
      if Comparison.separation(term_one, term_two).between?(0, opts[:context])
        file.has_context = true
      end
    end
  end
  puts file.full_path.to_s if file.has_context
end
