# File: formatter.rb
class Formatter
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

  def self.results_formatter(results, directory, first_term, second_term, context_index)
    if results == []
      puts "No matching files found."
    else
      puts "The following files contain the given search terms \"#{first_term}\" and \"#{second_term}\""
      puts "within #{context_index} words of each other in the directory \"#{directory}\":"
      puts '---------------------------------------------------------------------'
      puts results
    end
  end
end
