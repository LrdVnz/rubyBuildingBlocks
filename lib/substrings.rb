# frozen_string_literal: true

dictionary = %w[below down go going horn how howdy it i low own part partner sit]

def substrings(phrase, dict)
  results = {}

  dict.each do |word|
    counts = phrase.scan(word).count
    phrase.scan(word) { |c| results[c] = counts }
  end

  puts results
end

substrings('go below low low', dictionary)
substrings("Howdy partner, sit down! How's it going?", dictionary)
