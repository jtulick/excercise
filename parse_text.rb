# File: parse_text.rb
def parse_text(file_to_parse, first_search_term, second_search_term)
  read_word_count = 0
  term1_array = []
  term2_array = []
  File.open(file_to_parse).each do |line|
    line_array = line.split(/\W+/)
    downcased_line = line_array.map(&:downcase)
    line_word_count = line.split(/\W+/).size
    term1_locations = downcased_line.size.times.select \
    { |term| downcased_line[term] == first_search_term }
    term2_locations = downcased_line.size.times.select \
    { |term| downcased_line[term] == second_search_term }
    term1_locations.each do |word|
      term1_array << read_word_count + word
    end
    term2_locations.each do |word|
      term2_array << read_word_count + word
    end
    read_word_count += line_word_count
  end
  [file_to_parse, term1_array, term2_array]
end
