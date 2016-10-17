# File: comparison.rb
class Comparison
  def self.separation(first_word, second_word)
    term_separation = first_word - second_word
    return term_separation.abs
  end

  def self.is_text?(file_to_check)
    if file_to_check.end_with? '.txt'
      return true
    else
      return false
    end
  end
end
