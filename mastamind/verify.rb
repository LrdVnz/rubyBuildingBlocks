require 'pry'

$code = %w[red green blue blue]
$guess = %w[yellow green blue blue]
def decoder_verify
  result = Array.new(4, '')
  black = $code.zip($guess).count { |i| i.inject(:eql?) }
  if black == 4
    black.times { result.unshift('black').pop }
  else
    white = $guess.uniq.count { |i| $code.include?(i) }
    white -= black if white >= black
    black.times { result.unshift('black').pop }
    white.times { result.unshift('white').pop }
  end
  final = result.reject { |x| x == '' }
  final
 end
binding.pry
