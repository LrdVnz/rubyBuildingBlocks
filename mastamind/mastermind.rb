# frozen_string_literal: true

require 'pry'
COLORS = %w[red yellow blue green purple brown].freeze

# general game class
class Game
  def initialize
    @winner = false
    @turns = 0
    @code = []
    gamemode
  end

  def verify(guess, code)
    result = Array.new(4, '')
    guess.uniq.each { |i| result.unshift('white').pop if code.include?(i) }
    code.zip(guess).each { |i| result.unshift('black').pop if i.inject(:eql?) }
    result.reject { |x| x == '' }
  end

  def gamemode
    puts "Do you want to be the code 'Creator' or the 'Decoder' ? "
    mode = gets.chomp.downcase
    if mode == 'creator'
      creator_select
      creator_game
    elsif mode == 'decoder'
      0.upto(3) { |_i| @code << COLORS.sample }
      @cpu = Cpu.new(@code)
      @player = Player.new
      decoder_game
    end
  end

  def creator_select
    puts 'Choose 4 colors from these : '
    p COLORS
    0.upto(3) { |_i| @code << gets.chomp.downcase }
    @player = Player.new(@code)
    @cpu = Cpu.new
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
    gets
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
    p verified
    @winner = true if verified == win_arr
  end
end

class Player < Game
  attr_reader :code
  def initialize(code = '')
    @code = code
  end

  def guess
    @choice = []
    puts '-----------------------'
    puts 'Choose your colors'
    0.upto(3) { |_i| @choice << gets.chomp.downcase }
    @choice
  end
end

# controls for cpu
class Cpu
  attr_reader :code
  def initialize(code = '')
    @code = code
    @choice = Array.new(4, '')
  end

  def guess
    puts '-----------------------'
    puts 'The cpu chose :'
    @choice.map! { |i| i = i == '' ? COLORS.sample : i }
    @choice
  end

  def keep; end
end

game = Game.new
