# frozen_string_literal: true

require 'pry'
COLORS = %w[red yellow blue green purple brown].freeze

module SharedFunctions
  def playrounds
    @player_array = getarray
    @turns += 1
    arr = @cpu.verify(@player_array)
    win_arr = Array.new(4, 'black')
    puts '///////////'
    p arr
    @winner = true if arr == win_arr
  end

  def player_guess
    @player_choice = []
    puts '-----------------------'
    puts 'Choose your colors'
    0.upto(3) { |i| @code << gets.chomp.downcase }
    @player_choice
  end

  def verify(guess, code)
    result = Array.new(4, '')
    black = code.zip(guess).count { |i| i.inject(:eql?) }
    if black == 4
      black.times { result.unshift('black').pop }
    else
      white = guess.uniq.count { |i| code.include?(i) }
      white -= black if white >= black
      black.times { result.unshift('black').pop }
      white.times { result.unshift('white').pop }
    end
    final = result.reject{|x| x == ""}
    final
  end
end

#general game class
class Game
  include SharedFunctions

  def initialize
    @winner = false
    @turns = 0
    @code = []
    gamemode
  end

  def gamemode 
    puts "Do you want to be the code 'Creator' or the 'Decoder' ? "
    mode = gets.chomp.downcase 
      if mode == "creator"
        puts "Choose 4 colors from these : "
        p COLORS 
        0.upto(3) { |i| @code << gets.chomp.downcase }
        @player = Player.new(@code)
        @cpu = Cpu.new()
        creator_game
      elsif mode == "decoder"
        0.upto(3) { |i| @code << COLORS.sample }
        @cpu = Cpu.new(@code)
        @player = Player.new()
        decoder_game
      end
  end
  
  def creator_game 
    loop do
      creator_rounds
      if @winner == true
        puts 'YOU WIN'
        break
      elsif @turns == 12 && @winner == false
        puts 'YOU LOSE. The code is:'
        p @code
        break
      end
    end
  end

  def creator_rounds
    @guess = @cpu.guess
    @turns += 1
    verified = verify(@guess, @code)
    won = Array.new(4, 'black')
    puts '///////////'
    puts @guess
    p verified
    @winner = true if verified == won
    go_on = gets
  end
   
  def decoder_game
    loop do
      decoder_rounds
      if @winner == true
        puts 'YOU WIN'
        break
      elsif @turns == 12 && @winner == false
        puts 'YOU LOSE. The code is:'
        p @code
        break
      end
    end
  end

  def decoder_rounds
    @guess = @player.guess
    @turns += 1
    verified = verify(@guess, @code)
    win_arr = Array.new(4, 'black')
    puts '///////////'
    p arr
    @winner = true if verified == win_arr
  end

end

class Player 
 include SharedFunctions
  attr_reader :code
  def initialize(code = "")
        @code = code
  end

  def guess
    @choice = []
    puts '-----------------------'
    puts 'Choose your colors'
    0.upto(3) { |i| @choice << gets.chomp.downcase }
    @choice
  end

end

#controls for cpu
class Cpu
 include SharedFunctions
  attr_reader :code
  def initialize(code = "")
    @code = code
  end

  def guess
    @choice = []
    puts '-----------------------'
    puts 'The cpu chose :'
    0.upto(3) { |i| @choice << COLORS.sample }
    @choice
  end

end

game = Game.new
