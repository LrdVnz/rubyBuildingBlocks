require 'pry'

COLORS = %w[red yellow blue green purple brown].freeze

$code = %w[red blue green yellow]
$progress = Array.new(4, '')
$guess = Array.new(4, '')

def fill
  $guess.map! { |i| i = i == '' ? COLORS.sample : i }
 end

def keep_equal
  $blacks = Array.new(4, '')
  $whites = Array.new(4, '')
  fill
  $code.zip($guess).each_with_index do |x, index|
    if x.inject(:eql?) == true
      $blacks[index] = $guess[index]
    elsif $code.include?($guess[index])
      $range = [*0...$code.length] - [index]
      $random = $range.sample
      $random = $range.sample while $blacks[$random] != ''
      $whites[$random] = $guess[index]
    end
  end

  $blacks.each_with_index do |x, _index|
    i = 0
    while i < $whites.length
      $whites[i] = '' if x == $whites[i] && x != ''
      i += 1
    end
  end

  $whites.each_with_index { |x, index| $progress[index] = x if x != '' }

  $blacks.each_with_index { |x, index| $progress[index] = x if x != '' }

  $guess = $progress
end

binding.pry
