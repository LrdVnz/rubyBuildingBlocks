# frozen_string_literal: true

#helper module for methods regarding the board.
module Board
  def find_win_combo(sign)
    WIN_COMBOS.detect do |combo|
      board[combo[0]] == board[combo[1]] &&
        board[combo[1]] == board[combo[2]] &&
        board[combo[0]] == sign
    end
  end

  def board_full?
    is_full = board.all? { |cell| cell != ' ' }
    return unless is_full

    @winner = true
    puts "It's a tie"
    nil
  end

  def showboard
    first_row
    puts ' ----------- '
    second_row
    puts ' ----------- '
    third_row
  end

  def first_row
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
  end

  def second_row
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
  end

  def third_row
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end
end
