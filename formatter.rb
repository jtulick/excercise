# File: formatter.rb

class OutputFormatter # Class for formatting text
  def self.request_inputs
    puts 'Enter the directory to search: '
    directory_to_search = gets.chomp
    until Dir.exist?(directory_to_search)
      puts "Directory #{directory_to_search} does not exist."
      puts 'Please enter a valid directory to search: '
      directory_to_search = gets.chomp
    end

    puts 'Enter the first search term: '
    first_search_term = gets.chomp
    puts 'Enter the second search term: '
    second_search_term = gets.chomp
    puts 'Enter the context variable: '
    context_words_separation = gets.chomp.to_i
    while context_words_separation.zero?
      puts 'The context variable must be a positive integer, please enter the '
      puts 'context variable again:'
      context_words_separation = gets.chomp.to_i
    end
    return directory_to_search, first_search_term, second_search_term, \
      context_words_separation
  end

  def self.notification_confirmation(
    directory,
    first_term,
    second_term,
    context_index
  )
    puts '---------------------------------------------------------------------'
    puts 'Beginning query with the following parameters:'
    puts "Directory: #{directory}"
    puts "First Search Term: #{first_term}"
    puts "Second Search Term: #{second_term}"
    puts "Context Variable: #{context_index}"
    puts '---------------------------------------------------------------------'
  end

  def self.results_formatter(
    results,
    directory,
    first_term,
    second_term,
    context_index
  )
    puts "The following files contain the given search terms \"#{first_term}\" \
and \"#{second_term}\", within #{context_index} words of each other in the \
directory \"#{directory}\":"
    puts '---------------------------------------------------------------------'
    puts results
  end
end
