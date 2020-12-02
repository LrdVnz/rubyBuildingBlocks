let(:error_message) { 'Wrong Input! Choose X or O.' }

#Script method. Test methods called and then return values
 context "when input is correct(X or O)" do
  before do 
   valid_input = 'X'
   allow(game_start).to receive(:startgame)
   allow(player).to receive(:player_choice)
   allow(player).to receive(:gets).and_return(valid_input)
  end

      it "returns the correct sign " do
        expect(game_start).not_to receive(:puts).with(error_message)
        game_start.startgame
      end
  end

 context "when input is incorrect" do
  before do
   invalid_input = 'E'
   allow(game_start).to receive(:startgame)
   allow(player).to receive(:player_choice)
   allow(player).to receive(:gets).and_return(invalid_input)
  end

  it "returns the error message" do
    expect(player).to receive(:puts).with(error_message)
    game_start.startgame
  end
   
 end