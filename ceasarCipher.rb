def caesar_cipher(word, key)
   lowcase = ['a'.ord..'z'.ord]
   upcase = ['A'.ord..'Z'.ord]
   letters = word.bytes

   letters.map { |char|
   lowcase.include?(char)? (char) : char

   upcase.include?(char)? (char = upcase[char + key]) : char

}.join 

end
    
