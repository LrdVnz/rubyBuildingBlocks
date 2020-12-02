# frozen_string_literal: true

# Player class
class Player
  attr_accessor :sign

  def initialize(sign)
    @sign = sign
  end

  def player_choice
    loop do
      puts 'p1 choose a sign'
      choice = gets.chomp.upcase
      return choice if choice.match(/[X,Y]/)

      puts 'Wrong Input! Choose X or O.'
    end
  end

  def choose_position(player)
    loop do
      puts "#{player.sign} Choose a position between 0 and 9."
      pos = gets.chomp.to_i
      return pos if pos.is_a?(Integer) && pos.between?(0, 9)

      puts 'Please choose an integer between 0 and 9.'
    end
  end
end
