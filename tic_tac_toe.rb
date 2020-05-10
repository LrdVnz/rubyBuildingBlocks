require 'pry'

$a = [" ", " ", " "]

$b = [" ", " ", " "]

$c = [" ", " ", " "]

$winner = false

def showBoard
    print $a 
    puts "\n"
    print $b
    puts "\n"
    print $c
    puts "\n"
end


class Player
  attr_reader :sign

  def initialize(sign)
   @sign = sign 
  end
  $i = 0
  def put_sign(row, column, sign = @sign)
    case row
    when "a" 
       if $a[column] == " "
        $a[column] = sign
        $i = $i + 1
        puts "i is #{$i}"
        showBoard
          if $i == 3 
            win
          end
        else
        puts "choose another space!"
        call_put
       end
    when "b"
       if $b[column] == " "
        $b[column] = sign
        $i = $i + 1
        puts "i is #{$i}"
        showBoard
        if $i == 3 
          win
        end
      else
        puts "choose another space!"
        call_put
       end
    when "c"
       if $c[column] == " " 
        $c[column] = sign
        $i = $i + 1
        puts "i is #{$i}"
        showBoard
        if $i == 3 
          win
        end
      else
        puts "choose another space!"
        call_put
       end
    end
  end


  def win(sign = @sign)

    rowA, columnA = [], [] 
    $a.each_with_index { |item, i | 
       if item == sign
     rowA.push(item)
     columnA.push(item)
       end
    }

    rowB, columnB = [], []
    $b.each_with_index { |item, i | 
       if item == sign
     rowB.push(item)
     columnB.push(item)
       end
    }

    rowC, columnC = [], []
    $c.each_with_index { |item, i | 
       if item == sign
     rowC.push(item)
     columnC.push(item)
       end
    }
      if rowA == rowB && rowB == rowC && rowC == rowA
          $winner = true
          puts "YOU WIN"
      elsif columnA == columnB && columnB == columnC && columnC == columnA 
          $winner = true
          puts "YOU WIN"
      elsif rowA == columnA && rowB == columnB && rowC == columnB 
          $winner = true
          puts "YOU WIN!"
      end
   end
end



class CPU < Player
  attr_reader :compsign

  def initialize(compsign)
    @compsign = compsign
  end

  def put_sign(row = ("a".."c").to_a.sample, column = rand(2), sign = @compsign)
    i = 0
    case row
    when "a" 
       if $a[column] == " "
        $a[column] = sign
        i = i + 1
          if i == 3 
            win(@compsign)
          end
       else 
        self.put_sign
       end
    when "b"
       if $b[column] == " "
        $b[column] = sign
        i = i + 1
        if i == 3 
          win(@compsign)
        end
       else
        self.put_sign
       end
    when "c"
       if $c[column] == " " 
        $c[column] = sign
        i = i + 1
        if i == 3 
          win(@compsign)
        end
       else
        self.put_sign
       end
    end
  end

  def win(sign = @compsign)
    rowA, columnA = [], [] 

    $a.each_with_index { |item, i | 
       if item == sign
     rowA.push("a")
     columnA.push(i)
       end
    }
    rowB, columnB = [], []

    $b.each_with_index { |item, i | 
       if item == sign
     rowB.push("b")
     columnB.push(i)
       end
    }
    rowC, columnC = [], []

    $c.each_with_index { |item, i | 
       if item == sign
     rowC.push("c")
     columnC.push(i)
       end
    }
      if rowA == rowB && rowB == rowC && rowC == rowA
          $winner = true
          puts "YOU LOST"
      elsif rowA != rowB && rowB != rowC && rowC != rowA 
        if columnA == columnB && columnB == columnC && columnC == columnA 
          $winner = true
          puts "YOU LOST"
        elsif columnA != columnB && columnB != columnC && columnC != columnA
          $winner = true
          puts "YOU LOST"
        end
      end
   end
end


def start_game 
 puts "Choose a sign ! X or O"
 sign = gets.chomp 
   if sign == "X" || sign == "x"
    $p1 = Player.new("X")
    $cpu = CPU.new("O")
    puts "You are '$p1' ."
   elsif sign == "O" || sign == "o"
    $p1 = Player.new("O")
    $cpu = CPU.new("X")
    puts "You are '$p1' ."
   else 
    puts "Choose X or O"
    start_game
   end
end

start_game
puts "Use call_put to put a sign.Choose a to b for rows and 0 to 2 for columns."

def call_put 
  puts "Choose a row"
  rows = gets.chomp
  puts "Choose a column"
  columns = gets.chomp.to_i
  $p1.put_sign(rows, columns)
  $cpu.put_sign()
end

while $winner == false
  call_put
end
