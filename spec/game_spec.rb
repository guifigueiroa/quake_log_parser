require_relative 'spec_helper'

describe Game do
  let(:game) { Game.new }
  
  describe "when instanciating" do
    it "fills name with game number" do
      expect(game.name).to eq "game_1"
      game2 = Game.new
      expect(game2.name).to eq "game_2"
    end
  end
  
  describe "#add_player" do
    it "rejects duplicate players" do
      game.add_player "Guilherme"
      game.add_player "Guilherme"
      expect(game.players).to contain_exactly "Guilherme"
    end
  end
end