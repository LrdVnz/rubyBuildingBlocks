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

# Main game class
class Game
  attr_accessor :board, :n, :winner, :p1, :p2
  def initialize
    @winner = false
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    startgame
  end

  def startgame(p1sign = 'X')
    puts 'p1 choose a sign'
    p1sign = gets.chomp.upcase
    if p1sign == 'X'
      @p1 = Player.new('X')
      @p2 = Player.new('O')
    elsif p1sign == 'O'
      @p1 = Player.new('O')
      @p2 = Player.new('X')
    else
      return "Please choose between X or O"
    end 

   while winner == false
    call_put(@p1)
    call_put(@p2)
    end
  end

  def call_put(player)
    return if @winner == true
    puts "#{player.sign} Choose a position"
    pos = gets.chomp.to_i
    call_put if !pos.is_a? Integer
    put_sign(pos, player)
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

    return @board unless has_won

    @winner = true
    return "#{sign} WINS"
  end

  def full_board?
    is_full = @board.all? { |cell| cell != ' ' }
    return unless is_full && @winner == false

    @winner = true
    return "It's a tie"
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