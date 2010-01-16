def binary_find range, searched
  middle = range.length / 2
  chosen = range[middle]

  return middle if chosen == searched
  return nil if range.length <= 1 || range.length >= searched

  if chosen < searched
    found = binary_find range[middle..-1], searched
    found ? middle + found : nil
  else
    binary_find range[0..middle], searched
  end
end


expected_results = { 
  [] => 1, 
  [1] => 1,
  [1,3] => 3,
  [1, 3, 4] => 3,
  [1, 3, 4] => 3,
  [1, 3, 4] => 100,
  [1, 3, 4, 6, 8, 9, 12, 15, 17, 20] => 17
}

expected_results.each do |range, searched|
  raise "ugh #{range}" if binary_find(range, searched) != range.index(searched)
  raise "ugh2" if binary_find(range, 2) != nil
end
