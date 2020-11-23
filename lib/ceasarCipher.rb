# frozen_string_literal: true

def caesar_cipher(word, key)
  if key.is_a? Float 
    return "Decimals aren't accepted."
  elsif key > 26
    return "Please put a key less or equal 26."
  end
  lowcase = (('a'.ord)..('z'.ord)).to_a
  upcase = (('A'.ord)..('Z'.ord)).to_a
  letters = word.split("")

  letters.map{ |letter| 
  if lowcase.include?(letter.ord)
     if (lowcase.index(letter.ord) + key) > (lowcase.length - 1)
       factor = key - ((lowcase.length - 1) - lowcase.index(letter.ord))
       letter = lowcase[factor - 1].chr
     elsif(lowcase.index(letter.ord) + key).negative?
      factor = lowcase.index(letter.ord) + key
      letter = lowcase[factor].chr
     else 
      letter = lowcase[lowcase.index(letter.ord) + key].chr
     end
     letter
  end

  if upcase.include?(letter.ord)
    if (upcase.index(letter.ord) + key) > (upcase.length - 1)
    factor = key - ((upcase.length - 1) - upcase.index(letter.ord))
    letter = upcase[factor - 1].chr
    elsif (upcase.index(letter.ord) + key).negative?
    factor = upcase.index(letter.ord) + key
    letter = upcase[factor].chr
    else
    letter = upcase[upcase.index(letter.ord) + key].chr
    end
  else
  letter
  end
  }.join("")
end