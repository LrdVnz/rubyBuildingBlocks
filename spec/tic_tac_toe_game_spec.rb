  require "./lib/tic_tac_toe/game.rb"
  
  describe Game  do
    describe "#initalize" do
      # initialize --> no need for testing
    end

    describe "#startgame" do
    subject(:game_start) { described_class.new }
    let(:player) { double(Player) }
      
       context "when it is called" do
          before do
          allow(game_start).to receive(:game_loop)
         end

           it "calls player_choice" do
             expect(game_start).to receive(:player_choice)
             game_start.startgame
          end
       end

       context "when p1sign is correct and X " do
         before do
            p1sign_input = 'X' 
            allow(game_start).to receive(:player_choice).and_return(p1sign_input)
            allow(game_start).to receive(:game_loop)
         end

          it "creates new players p1 with X and p2 with Y signs" do
            expect(Player).to receive(:new).with('X')
            expect(Player).to receive(:new).with('O')
            game_start.startgame 
          end
     end
    end

     describe "#game_loop" do 
       #Looping script method. ---> test results methods called
      subject(:game_on_loop) { described_class.new }
      
       context "when winner is true" do
         before do 
          game_on_loop.instance_variable_set(:@winner, true)
         end
         
        #am I testing basic loops that don't need to be tested ??
        it "stops loop and returns nil" do
           expect(game_on_loop).to receive(:game_loop).and_return(nil)
           game_on_loop.game_loop
        end
       end
    end

     describe "#call_put" do
      subject(:game_call_put) { described_class.new }
      let(:p1)  { Player.new('X') }

       context "when winner is true " do
          before do 
            game_call_put.instance_variable_set(:@winner, true)
          end

        it "returns nil" do
          expect(game_call_put).to receive(:call_put).with(p1).and_return(nil)
          game_call_put.call_put(p1)
        end
       end
       #the call to choose_position and put_sign shouldn't need to be tested
     end


    end
 
 
 
=begin require 'stringio'

  describe "#Game" do 

  describe ".win" do 

    before(:each) do 
      @game = double('Game')
      @game.instance_variable_set(:@board, [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '])
    end

    it "shows the winner if top row is all X" do
      allow(@game).to receive(:board).and_return(['X','X','X'])
      @game.board[0,2] = ['X','X','X']
      expect(@game).to receive(:win).with('X').and_return('X WINS')
      @game.win('X')
    end

   it "shows the winner if middle row is all X" do
    allow(@game).to receive(:board).and_return(['X','X','X'])
        @game.board[3,5] = ['X', 'X', 'X']
        expect(@game).to receive(:win).with('X').and_return('X WINS')
        @game.win('X')
    end

    it "shows the winner if bottom row is all X" do
      allow(@game).to receive(:board).and_return(['X','X','X'])
        @game.board[6,8] = ['X', 'X', 'X']
        expect(@game).to receive(:win).with('X').and_return('X WINS')
        @game.win('X')
    end
  end

    it "shows the winner if left column is all X" do
       allow(@game).to receive(:board).and_return(['X'],['X'],['X'])
        @game.board[0] = 'X'
        @game.board[3] = 'X'
        @game.board[6] = 'X'
        expect(@game.board[0])
        expect(@game).to receive(:win).with('X').and_return('X WINS')
        @game.win('X')
    end
=begin
    it "shows the winner if middle column is all O" do
        @game.board[1] = 'O'
        @game.board[4] = 'O'
        @game.board[7] = 'O'
        expect(@game).to receive(:win).with('X').and_return('X WINS')
        @game.win('X')
    end

    it "shows the winner if right column is all O" do
        @game.board[2] = 'O'
        @game.board[5] = 'O'
        @game.board[8] = 'O'
        expect(@game).to receive(:win).with('X').and_return('X WINS')
        @game.win('X')
    end

    it "shows the winner if left diagonal is all O" do
        @game.board[0] = 'O'
        @game.board[4] = 'O'
        @game.board[8] = 'O'
        expect(@game).to receive(:win).with('X').and_return('X WINS')
        @game.win('X')
    end

    it "shows the winner if right diagonal is all O" do
        @game.board[2] = 'O'
        @game.board[4] = 'O'
        @game.board[6] = 'O'
        expect(@game).to receive(:win).with('X').and_return('X WINS')
        @game.win('X')
    end
  end

  describe '.full_board' do 
     it "returns : 'Board is full' if board is full(duh) of X" do
         @game = double(@game.new)
         @game.board.map!{|cell| cell == 'X'}
         expect(@game.full_board?).to eql("It's a tie") 
     end

     it "returns : 'Board is full' if board is full(duh) of O" do
         @game = double(@game.new)
         @game.board.map!{|cell| cell == 'O'}
         expect(@game.full_board?).to eql("It's a tie")
     end
   end

   describe "#start@game" do
       allow($stdin).to receive(:gets).and_return('E')
    it "calls itself if the choice isn't X or O" do 
         orig_stdin = $stdin
         $stdin = StringIO.new('E')
         $stdin = orig_stdin
        end
     end

  describe ".put_sign" do
     it "calls call_put if cell chosen is already take" do 
          mock = double(@game.new)
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
           mock = double(@game.new)
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
