# Class for the "Creator" mode
class Creator
  include CreatorHelpers
  def initialize
    @turns = 0
    @winner = false
    @code = []
    @progress = Array.new(4, '')
    @guess = Array.new(4, '')
    start_game
  end

  def creator_game
    loop do
      creator_rounds
      if @winner == true
        puts 'CPU WINS'
        break
      elsif @turns == 12 && @winner == false
        creator_loser
        break
      end
    end
  end

  def creator_rounds
    fill
    @turns += 1
    puts '///////////'
    puts @guess
    check_verified
    gets
  end

  def verify
    @result = Array.new(4, '')
    @black = count_black
    if @black == 4
      put_black
    else
      verify_whites
    end
    keep_equal
    @result.reject { |x| x == '' }
  end

  def keep_equal
    create_pegs
    fill
    @code.zip(@guess).each_with_index do |x, index|
      if x.inject(:eql?) == true
        @blacks[index] = @guess[index]
      elsif @code.include?(@guess[index])
        keep_whites(index)
      end
    end
    pegs_guess
  end
end

# helpers for creator
module CreatorHelpers
  def verify_whites
    @white = count_white
    @white -= @black if @white >= @black
    put_black
    put_white
  end

  def pegs_guess
    keep_blacks
    create_guess
  end

  def create_pegs
    @progress = Array.new(4, '')
    @blacks = Array.new(4, '')
    @whites = Array.new(4, '')
  end

  def create_guess
    @whites.each_with_index { |x, index| @progress[index] = x if x != '' }
    @blacks.each_with_index { |x, index| @progress[index] = x if x != '' }
    @guess = @progress
  end

  def keep_blacks
    @blacks.each_with_index do |x, _index|
      i = 0
      while i < @whites.length
        @whites[i] = '' if x == @whites[i] && x != ''
        i += 1
      end
    end
  end

  def keep_whites(index)
    range = [*0...@code.length] - [index]
    random = range.sample
    random = range.sample while @blacks[random] != ''
    @whites[random] = @guess[index]
  end

  def fill
    @guess.map! { |i| i == '' ? COLORS.sample : i }
  end

  def start_game
    show_options
    choice
    creator_game
  end

  def check_verified
    won = Array.new(4, 'black')
    p verify
    @winner = true if verify == won
  end

  def show_options
    puts 'Choose 4 colors from these : '
    puts COLORS
    puts '------------'
  end

  def choice
    0.upto(3) { |_i| @code << gets.chomp.downcase }
  end

  def count_black
    @code.zip(@guess).count { |i| i.inject(:eql?) }
  end

  def put_black
    @black.times { @result.unshift('black').pop }
  end

  def count_white
    @guess.uniq.count { |i| @code.include?(i) }
  end

  def put_white
    @white.times { @result.unshift('white').pop }
  end

  def creator_loser
    puts 'PLAYER WINS. The code is:'
    p @code
  end
end
