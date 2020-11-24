require "./lib/tic_tac_toe.rb"
require 'stringio'

describe "#Game" do 
   describe ".win" do 
    it "shows the winner if top row is all X" do
      game = double(Game.new)
      orig_stdin = $stdin
      $stdin = StringIO.new('X')

      allow(game).to receive(:startgame).and_return('X')
      game.board[0,2] = ['X', 'X', 'X']
       expect(game.win('X')).to eql('X WINS')
    end
end
=begin
    it "shows the winner if middle row is all X" do
        game = double(Game.new)
        game.board[3,5] = ['X', 'X', 'X']
         expect(game.win('X')).to eql('X WINS')
    end

    it "shows the winner if bottom row is all X" do
        game = double(Game.new) 
        game.board[6,8] = ['X', 'X', 'X']
         expect(game.win('X')).to eql('X WINS')
    end

    it "shows the winner if left column is all X" do
        game = double(Game.new) 
        game.board[0] = 'X'
        game.board[3] = 'X'
        game.board[6] = 'X'
         expect(game.win('X')).to eql('X WINS')
    end
  
    it "shows the winner if middle column is all O" do
        game = double(Game.new) 
        game.board[1] = 'O'
        game.board[4] = 'O'
        game.board[7] = 'O'
         expect(game.win('O')).to eql('O WINS')
    end

    it "shows the winner if right column is all O" do
        game = double(Game.new) 
        game.board[2] = 'O'
        game.board[5] = 'O'
        game.board[8] = 'O'
         expect(game.win('O')).to eql('O WINS')
    end

    it "shows the winner if left diagonal is all O" do
        game = double(Game.new)
        game.board[0] = 'O'
        game.board[4] = 'O'
        game.board[8] = 'O'
         expect(game.win('O')).to eql('O WINS')
    end

    it "shows the winner if right diagonal is all O" do
        game = double(Game.new)
        game.board[2] = 'O'
        game.board[4] = 'O'
        game.board[6] = 'O'
         expect(game.win('O')).to eql('O WINS')
    end
   end

   describe '.full_board' do 
     it "returns : 'Board is full' if board is full(duh) of X" do
         game = double(Game.new)
         game.board.map!{|cell| cell == 'X'}
         expect(game.full_board?).to eql("It's a tie") 
     end

     it "returns : 'Board is full' if board is full(duh) of O" do
         game = double(Game.new)
         game.board.map!{|cell| cell == 'O'}
         expect(game.full_board?).to eql("It's a tie")
     end
   end

   describe "#startgame" do
    it "calls itself if the choice isn't X or O" do 
         orig_stdin = $stdin
         $stdin = StringIO.new('E')
         $stdin = orig_stdin
        end
     end

  describe ".put_sign" do
     it "calls call_put if cell chosen is already take" do 
          mock = double(Game.new)
          p1 = double(Player.new('X'))
          p2 = double(Player.new('O'))
          allow(mock).to receive(:put_sign)
          expect(mock).to receive(:put_sign).with(1, p2).and_return(:call_put)
          mock.put_sign(1,p1)
          mock.put_sign(1,p2)
        end
      end

      describe ".call_put" do
      it "returns if winner is true" do 
           mock = double(Game.new)
           mock.instance_variable_set(:@winner, true)
           expect(mock).to receive(:call_put).and_return(nil)
           mock.call_put
         end
       end

       it "calls itself if player inputs a non-number" do 
        mock = double(Game.new)
        allow(mock).to receive(:gets).and_return('b')
        expect(mock).to receive(:call_put).and_return(:call_put)
        mock.call_put
      end
=end
end
