# frozen_string_literal: true

WIN_COMBOS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
].freeze

# Container module for the game actions (start and play)
module PlayGame
  def startgame
    puts 'p1 choose a sign'
    p1sign = gets.chomp.upcase
    if p1sign == 'X'
      @p1 = Player.new('X')
      @p2 = Player.new('O')
    elsif p1sign == 'O'
      @p1 = Player.new('O')
      @p2 = Player.new('X')
    end

    while winner == false
      call_put(@p1)
      call_put(@p2)
    end
  end

  def call_put(player)
    puts "#{player.sign} Choose a position"
    pos = gets.chomp.to_i
    put_sign(pos, player)
  end
end

# Main game class
class Game
  include PlayGame
  attr_accessor :board, :n, :winner, :p1, :p2
  def initialize
    @winner = false
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  def showboard
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts ' ----------- '
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts ' ----------- '
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def put_sign(position, player)
    if @board[position] == ' '
      @board[position] = player.sign
      showboard
      win(player.sign)
      full_board?
    else
      puts 'Choose another cell'
      showboard
      call_put(player)
    end
  end

  def win(sign)
    has_won = WIN_COMBOS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
        @board[combo[1]] == @board[combo[2]] &&
        @board[combo[0]] == sign
    end

    return unless has_won

    puts "#{sign} WINS"
    @winner = true
  end

  def full_board?
    is_full = @board.all? { |cell| cell != ' ' }
    return unless is_full && @winner == false

    puts "It's a tie"
    @winner = true
  end
end

# Player class
class Player
  attr_accessor :sign

  def initialize(sign)
    @sign = sign
  end
end

game = Game.new
game.startgame
