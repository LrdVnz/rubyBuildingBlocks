# frozen_string_literal: true

# Class for the "Decoder" mode
class Decoder
  def initialize
    @turns = 0
    @winner = false
    @code = []
    @guess = []
    decoder_game
  end

  def decoder_game
    decoder_start
    loop do
      decoder_rounds
      if @winner == true
        puts 'YOU WIN'
        break
      elsif @turns == 12 && @winner == false
        decoder_loser
      end
    end
  end

  def decoder_rounds
    take_guess
    @verified = decoder_verify
    check_verify
    @winner = true if @verified == @win_pegs
    @turns += 1
  end

  def decoder_verify
    @result = Array.new(4, '')
    @blacks = count_blacks
    if @blacks == 4
      put_blacks
    else
      verify_whites
    end
    @result.reject { |x| x == '' }
  end

  def decoder_start
    show_options
    take_random
  end

  def decoder_loser
    puts 'YOU LOSE. The code is :'
    p @code
  end

  def show_options
    puts 'Choose 4 colors from these every turn:'
    puts COLORS
    puts '----------------'
  end

  def verify_whites
    @whites = count_whites
    @whites -= @blacks if @whites >= @blacks
    put_blacks
    put_whites
  end

  def check_verify
    @win_pegs = Array.new(4, 'black')
    puts '///////////'
    p @verified
  end

  def count_blacks
    @code.zip(@guess).count { |i| i.inject(:eql?) }
  end

  def put_blacks
    @blacks.times { @result.unshift('black').pop }
  end

  def count_whites
    @guess.uniq.count { |i| @code.include?(i) }
  end

  def put_whites
    @whites.times { @result.unshift('white').pop }
  end

  def take_random
    0.upto(3) { |_i| @code << COLORS.sample }
  end

  def take_guess
    @guess = []
    0.upto(3) { |_i| @guess << gets.chomp.downcase }
  end
end
