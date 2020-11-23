require "./lib/tic_tac_toe.rb"

describe "#Game" do 
   describe ".win" do 
    it "shows the winner if top row is all X" do
      game = Game.new 
      game.board[0,2] = ['X', 'X', 'X']
       expect(game.win('X')).to eql('X WINS')
    end

    it "shows the winner if middle row is all X" do
        game = Game.new 
        game.board[3,5] = ['X', 'X', 'X']
         expect(game.win('X')).to eql('X WINS')
    end

    it "shows the winner if bottom row is all X" do
        game = Game.new 
        game.board[6,8] = ['X', 'X', 'X']
         expect(game.win('X')).to eql('X WINS')
    end

    it "shows the winner if left column is all X" do
        game = Game.new 
        game.board[0] = 'X'
        game.board[3] = 'X'
        game.board[6] = 'X'
         expect(game.win('X')).to eql('X WINS')
    end
  
    it "shows the winner if middle column is all O" do
        game = Game.new 
        game.board[1] = 'O'
        game.board[4] = 'O'
        game.board[7] = 'O'
         expect(game.win('O')).to eql('O WINS')
    end

    it "shows the winner if right column is all O" do
        game = Game.new 
        game.board[2] = 'O'
        game.board[5] = 'O'
        game.board[8] = 'O'
         expect(game.win('O')).to eql('O WINS')
    end

    it "shows the winner if left diagonal is all O" do
        game = Game.new 
        game.board[0] = 'O'
        game.board[4] = 'O'
        game.board[8] = 'O'
         expect(game.win('O')).to eql('O WINS')
    end

    it "shows the winner if right diagonal is all O" do
        game = Game.new 
        game.board[2] = 'O'
        game.board[4] = 'O'
        game.board[6] = 'O'
         expect(game.win('O')).to eql('O WINS')
    end
   end

   describe '.full_board' do 
     it "returns : 'Board is full' if board is full(duh) of X" do
         game = Game.new
         game.board.map!{|cell| cell == 'X'}
         expect(game.full_board?).to eql("It's a tie")
     end

     it "returns : 'Board is full' if board is full(duh) of O" do
         game = Game.new
         game.board.map!{|cell| cell == 'O'}
         expect(game.full_board?).to eql("It's a tie")
     end
   end

   describe "#startgame" do 
     it "returns nil if player choice isn't X or O " do
         game = Game.new
         expect(game.startgame).to eql("Please choose between X or O")
     end
   end

end
