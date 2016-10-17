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

class Files
  attr_reader :name, :full_path, :term_one_locations, :term_two_locations, :has_context
  def initialize(name, full_path)
    @name = name
    @full_path = full_path
    @term_one_locations = []
    @term_two_locations = []
    @has_context = false
  end
  def find_words?(term_one, term_two)
    read_word_count = 0
    File.open(@full_path).each do |line|
      line_contents = line.split(/\W+/)
      downcased_line = line_contents.map(&:downcase)
      line_word_count = line.split(/\W+/).size
      term_one_line_locations = downcased_line.size.times.select{|term| downcased_line[term] == term_one}
      term_two_line_locations = downcased_line.size.times.select{|term| downcased_line[term] == term_two}
      term_one_line_locations.each do |word|
        @term_one_locations << read_word_count + word
      end
      term_two_line_locations.each do |word|
        @term_two_locations << read_word_count + word
      end
      read_word_count += line_word_count
    end
  end
  def has_context=(new_context)
    @has_context = new_context
  end
end
