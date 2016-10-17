# File: files.rb
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

  def set_context(context)
    @term_one_locations.each do |term_one|
      @term_two_locations.each do |term_two|
        if Comparison.separation(term_one, term_two).between?(0, context)
          @has_context = true
        end
      end
    end
  end
end
