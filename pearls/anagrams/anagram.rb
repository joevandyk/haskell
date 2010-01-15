def get_anagrams words
  result = Hash.new []
  words.each do |word|
    word.chomp!
    sorted_word = word.chars.sort.join
    result[sorted_word] += [word]
  end
  result.values.sort! { |a, b| b.size <=> a.size }
end

input = STDIN.readlines

p get_anagrams(input)[0..2]
