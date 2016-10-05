def check_files(parsed_files)
  matching_file_list = []
  parsed_files.each do |word_locations|
    unless word_locations.include? []
      matching_file_list << word_locations[0]
    end
  end
  if matching_file_list == []
    return "No matching context found for the given terms."
  else
    return matching_file_list
  end
end
