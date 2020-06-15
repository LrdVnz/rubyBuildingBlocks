class Decoder
    def initialize
      @turns = 0
      @winner = false
      @code = []
      @guess = []
      decoder_game
    end
  
    def decoder_game
      puts 'Choose 4 colors from these every turn:'
      puts COLORS
      puts "----------------"
      take_random
      loop do
        decoder_rounds
        if @winner == true
          puts 'YOU WIN'
          break
        elsif @turns == 12 && @winner == false
          puts 'YOU LOSE. The code is :'
          p @code
        end
      end
     end
  
    def take_random
      0.upto(3) { |_i| @code << COLORS.sample }
    end
  
    def take_guess
      @guess = []
      0.upto(3) { |_i| @guess << gets.chomp.downcase }
    end
  
    def decoder_rounds
      take_guess
      @turns += 1
      verified = decoder_verify
      win_arr = Array.new(4, 'black')
      puts '///////////'
      p verified
      @winner = true if verified == win_arr
    end
  
    def decoder_verify
      result = Array.new(4, '')
      black = @code.zip(@guess).count { |i| i.inject(:eql?) }
      if black == 4
        black.times { result.unshift('black').pop }
      else
        white = @guess.uniq.count { |i| @code.include?(i) }
        white -= black if white >= black
        black.times { result.unshift('black').pop }
        white.times { result.unshift('white').pop }
      end
      final = result.reject { |x| x == '' }
      final
    end
   end