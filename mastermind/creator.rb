# frozen_string_literal: true
require './creatorhelpers.rb'
# Class for the "Creator" mode
class Creator
  include CreatorHelpers
  def initialize
    @turns = 0
    @winner = false
    @code = []
    @progress = Array.new(4, '')
    @guess = Array.new(4, '')
    start_game
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

  def creator_rounds
    fill
    @turns += 1
    puts '///////////'
    puts @guess
    check_verified
    gets
  end

  def verify
    @result = Array.new(4, '')
    @black = count_black
    if @black == 4
      put_black
    else
      verify_whites
    end
    keep_equal
    @result.reject { |x| x == '' }
  end

  def keep_equal
    create_pegs
    fill
    @code.zip(@guess).each_with_index do |x, index|
      if x.inject(:eql?) == true
        @blacks[index] = @guess[index]
      elsif @code.include?(@guess[index])
        keep_whites(index)
      end
    end
    pegs_guess
  end
end

