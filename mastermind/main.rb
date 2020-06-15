# frozen_string_literal: true
load 'creator.rb'
load 'decoder.rb'

COLORS = %w[red yellow blue magenta cyan green].freeze

class Game
  def initialize
    gamemode
  end

  def gamemode
    puts "Do you want to be the code 'Creator' or the 'Decoder' ? "
    mode = gets.chomp.downcase
    case mode
    when 'decoder'
      Decoder.new
    when 'creator'
      Creator.new
    end
  end
end

Game.new