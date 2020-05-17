require 'pry'

$win_combos = {
 1 => [[0, 0], [0, 1], [0, 2]] ,
 2 => [[1, 0], [1, 1], [1, 2]] ,
 3 => [[2, 0], [2, 1], [2, 2]],
 4 => [[0, 0], [1, 0], [2, 0]],
 5 => [[0, 1], [1, 1], [2, 1]],
 6 => [[0, 2], [1, 2], [2, 2]],
 7 => [[0, 0], [1, 1], [2, 2]],
 8 => [[0, 2], [1, 1], [2, 0]]
}

$winner = false
$n = 0


 class Board 
    attr_accessor :grid

    def initialize 
        @grid = [
            [" ", " ", " "],
            [" ", " ", " "],
            [" ", " ", " "]    
           ]
      end
    
    def show
        print grid[0]
        print "\n"
        print grid[1]
        print "\n"
        print grid[2]
        print "\n"
    end
 end



 class Player
    attr_accessor :sign
    def initialize(sign, name)
        @sign = sign
        @name = name
    end
    
    def put_sign(row, column, sign = @sign)
        if $board.grid[row][column] == " "
            $board.grid[row][column] = sign
            $board.show
        else 
          puts "cell already occupied"
          call_put_oneplayer
        end
    win if $n > 1
    end


    def win
        result = []
        j = 0
    while j < $board.grid.length
      $board.grid[j].each_with_index { |a, i| 
      if a == @sign
        result.push([j, i])
      end
      }
      j += 1
    end

     $i = 1
    until $winner == true
    if $win_combos[$i] === result
        puts "#{@name} WINS"
        $winner = true
    end
    $i += 1
   end
 end
end


class CPU < Player
  def initialize
    if $p1.sign == "X"
      @cpusign = "O"
    elsif $p1.sign == "O"
      @cpusign = "X"
    end
   @name = "cpu"
  end

    def put_sign(row = rand(2), column = rand(2) , sign = @cpusign)
        if $board.grid[row][column] == " "
          $board.grid[row][column] = sign
          $board.show
        else 
          self.put_sign
        end
    win if $n > 1
     end
end


def start
$board = Board.new
puts "Write '1P' for one player mode vs the cpu, or '2P' for two player mode"
$mode = gets.chomp
if $mode == '1P'
  puts "Choose a sign. X or O"
  choice = gets.chomp
    if choice == "X" 
    $p1 = Player.new("X", "p1")
    $cpu = CPU.new
    elsif choice == "O"
    $p1 = Player.new("O", "p1")
    $cpu = CPU.new("X")
    end
    puts "You are 'p1' "
elsif $mode == '2P'
   puts "First player choose X or O"
   first_choice = gets.chomp
    if first_choice == "X"
      $p1 = Player.new("X", "p1")
      $p2 = Player.new("O", "p2")
      puts " p1 is X, p2 is O"
    elsif first_choice == "O"
      $p1 = Player.new("O", "p1")
      $p2 = Player.new("X", "p2")
      puts " p1 is O, p2 is X"
    end
end
end

def call_put_oneplayer
  puts "Choose a row"
  row1 = gets.chomp.to_i
  puts "Choose a column"
  col1 = gets.chomp.to_i
  $p1.put_sign(row1, col1)
end

def call_put_twoplayers
  puts "p1 choose a row"
  row1 = gets.chomp.to_i
  puts "Choose a column"
  col1 = gets.chomp.to_i
  $p1.put_sign(row1, col1)

  puts "p2 choose a row"
  row2 = gets.chomp.to_i
  puts "Choose a column"
  col2 = gets.chomp.to_i
  $p2.put_sign(row2, col2)

end

start 

def play_rounds
  if $mode == "1P"
    until $winner == true
      call_put_oneplayer
      $cpu.put_sign
      $n += 1
    end
  elsif $mode == "2P"
    until $winner == true
      call_put_twoplayers
      $n += 1
    end
  end
end

play_rounds