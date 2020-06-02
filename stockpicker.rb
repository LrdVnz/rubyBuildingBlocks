# frozen_string_literal: true

def stock_picker(arr)
  difs = {}
  arr.each_with_index do |num, index|
    i = index
    while i < arr.length
      difs[arr[i] - num] = [index, i]
      i += 1
   end
  end
  maximum = difs.keys.max
  puts difs[maximum]
  puts 'For a profit of ' + maximum.to_s + '$'
end

stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
stock_picker([2, 9, 18, 3, 19, 6, 7, 12, 1])
stock_picker([20, 1, 3, 5, 10, 14, 9, 7, 11])
