#!/usr/bin/env ruby

words = {}
ARGF.read.split(/\s+/).each do |word|
  letter = word[0]
  next if letter == letter.upcase
  words[letter] ||= []
  words[letter] << word
end

words.keys.sort.each do |letter|
  puts words[letter].sample
end
