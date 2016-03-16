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
  
  describe "add_kill" do
    before :each do
      game.add_kill "Guilherme", "MOD_ROCKET_SPLASH"
    end
    
    it "counts total_kills" do
      expect(game.total_kills).to eq 1
    end
    
    it "counts player kills" do
      expect(game.kills["Guilherme".to_sym]).to eq 1
      game.add_kill "Guilherme", "MOD_ROCKET_SPLASH"
      expect(game.kills["Guilherme".to_sym]).to eq 2
    end
    
    it "counts kill by means" do
      expect(game.kill_by_means["MOD_ROCKET_SPLASH".to_sym]).to eq 1
      game.add_kill "Guilherme", "MOD_ROCKET_SPLASH"
      expect(game.kill_by_means["MOD_ROCKET_SPLASH".to_sym]).to eq 2
    end
  end
end