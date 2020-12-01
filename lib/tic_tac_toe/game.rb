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

require_relative './player'
require_relative './board'

# Main game class
class Game < Player
  include Board
  attr_accessor :board, :winner, :p1, :p2

  def initialize  
    @winner = false
    @board = Array.new(9, ' ')
  end

  def startgame
    p1sign = player_choice
    case p1sign
    when 'X'
      @p1 = Player.new('X')
      @p2 = Player.new('O')
    when 'O'
      @p1 = Player.new('O')
      @p2 = Player.new('X')
    end

    game_loop
  end

  def game_loop
    until winner == true
      call_put(p1)
      call_put(p2)
    end
  end

  def call_put(player)
    return if winner == true

    pos = choose_position(player)
    put_sign(pos, player)
  end

  def put_sign(position, player)
    if board[position] == ' '
      board[position] = player.sign
      showboard
      game_over?(player)
    else
      puts 'Choose another cell'
      showboard
      call_put(player)
    end
  end

  def game_over?(player)
    won?(player.sign)
    board_full?
  end

  def won?(sign)
    has_won = find_win_combo(sign)
    return board unless has_won.is_a?(Array)

    @winner = true
    puts "#{sign} WINS"
    nil
  end
end

g = Game.new
g.startgame
