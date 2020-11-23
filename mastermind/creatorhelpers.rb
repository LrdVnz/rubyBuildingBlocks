# helpers for creator
module CreatorHelpers
    def verify_whites
      @white = count_white
      @white -= @black if @white >= @black
      put_black
      put_white
    end
  
    def pegs_guess
      keep_blacks
      create_guess
    end
  
    def create_pegs
      @progress = Array.new(4, '')
      @blacks = Array.new(4, '')
      @whites = Array.new(4, '')
    end
  
    def create_guess
      @whites.each_with_index { |x, index| @progress[index] = x if x != '' }
      @blacks.each_with_index { |x, index| @progress[index] = x if x != '' }
      @guess = @progress
    end
  
    def keep_blacks
      @blacks.each_with_index do |x, _index|
        i = 0
        while i < @whites.length
          @whites[i] = '' if x == @whites[i] && x != ''
          i += 1
        end
      end
    end
  
    def keep_whites(index)
      range = [*0...@code.length] - [index]
      random = range.sample
      random = range.sample while @blacks[random] != ''
      @whites[random] = @guess[index]
    end
  
    def fill
      @guess.map! { |i| i == '' ? COLORS.sample : i }
    end
  
    def start_game
      show_options
      choice
      creator_game
    end
  
    def check_verified
      won = Array.new(4, 'black')
      p verify
      @winner = true if verify == won
    end
  
    def show_options
      puts 'Choose 4 colors from these : '
      puts COLORS
      puts '------------'
    end
  
    def choice
      0.upto(3) { |_i| @code << gets.chomp.downcase.strip }
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
  
    def creator_loser
      puts 'PLAYER WINS. The code is:'
      p @code
    end
  end
  