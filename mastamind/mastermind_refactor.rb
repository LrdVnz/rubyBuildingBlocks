# frozen_string_literal: true

require 'pry'

COLORS = %w[red yellow blue green purple brown].freeze

class Game
  def initialize
    @turns = 0
    @winner = false
  end

  def gamemode
    puts "Do you want to be the code 'Creator' or the 'Decoder' ? "
    mode = gets.chomp.downcase
    if mode == 'creator'
      Creator.new
    elsif mode == 'decoder'
      Decoder.new
    end
  end
end

class Creator
  def initialize
    @turns = 0
    @winner = false
    @code = []
    @progress = Array.new(4, '')
    show_options
    get_choice
    creator_game
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

  def creator_loser
    puts 'PLAYER WINS. The code is:'
    p @code
  end

  def creator_rounds
    @guess = fill
    @turns += 1
    puts '///////////'
    puts @guess
    verified = verify
    won = Array.new(4, 'black')
    p verified
    @winner = true if verified == won
    gets
   end

   def verify    
    @result = Array.new(4, '')
    @black = count_black
    if @black == 4
      put_black
    else
      @white = count_white
      @white -= @black if @white >= @black
      put_black
      put_white
    end
    keep_equal
    final = @result.reject { |x| x == '' }
    final
  end

   def fill
    @progress.map! { |i| i = i == '' ? COLORS.sample : i }
   end

  def show_options
    puts 'Choose 4 colors from these : '
    p COLORS
  end

  def get_choice
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

  def keep_equal
    @equal_pos = false
    @code.zip(@guess).each_with_index {|x, index|
      if x.inject(:eql?) == true
        @equal_pos = true
      @progress[index] = @guess[index]
      else
        @progress[index] = ''
      end
      if @code.include?(@guess[index]) && @equal_pos == false
        range = ([*0..(@code.length - 1)] - [index])
        random = range.sample
        random = range.sample while @progress[random] != ''
        @progress[random] = @guess[index]
    end
    }
   end

    }
end

end


class Decoder

  def initialize
    @turns = 0
    @winner = false
    @code = []
    @guess = []
    decoder_game
  end


  def decoder_game
    take_random
    loop do
      decoder_rounds
      if @winner == true
        puts "YOU WIN"
        break
      elsif @turns == 12 && @winner == false
        puts "YOU LOSE. The code is :"
        p @code
      end
    end
   end
 
  def take_random 
     0.upto(3) { |i| @code << COLORS.sample }
  end
  
  def take_guess
  @guess = []
  0.upto(3) { |_i| @guess << gets.chomp.downcase }
  end

  def decoder_rounds
    puts "Choose 4 colors"
    take_guess
    @turns += 1
    verified = decoder_verify
    win_arr = Array.new(4, 'black')
    puts '///////////'
    p verified
    @winner = true if verified == win_arr
  end

  def decoder_verify
    result = Array.new(4, '')
    black = @code.zip(@guess).count { |i| i.inject(:eql?) }
    if black == 4
      black.times { result.unshift('black').pop }
    else
      white = @guess.uniq.count { |i| @code.include?(i) }
      white -= black if white >= black
      black.times { result.unshift('black').pop }
      white.times { result.unshift('white').pop }
    end
    final = result.reject { |x| x == '' }
    final
  end
 end

binding.pry