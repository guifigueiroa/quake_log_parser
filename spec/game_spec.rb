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
  
  describe "#add_kill" do
    before :each do
      game.add_kill "Guilherme", "player1", "MOD_ROCKET_SPLASH"
    end
    
    it "counts total_kills" do
      expect(game.total_kills).to eq 1
    end
    
    it "counts player kills" do
      expect(game.kills["Guilherme".to_sym]).to eq 1
      game.add_kill "Guilherme", "player1", "MOD_ROCKET_SPLASH"
      expect(game.kills["Guilherme".to_sym]).to eq 2
    end
    
    it "counts kill by means" do
      expect(game.kill_by_means["MOD_ROCKET_SPLASH".to_sym]).to eq 1
      game.add_kill "Guilherme", "player1", "MOD_ROCKET_SPLASH"
      expect(game.kill_by_means["MOD_ROCKET_SPLASH".to_sym]).to eq 2
    end
    
    it "decrements kills when killed by <world>" do
      game.add_kill "<world>", "player1", "MOD_FALLING"
      expect(game.kills[:player1]).to eq -1
    end
  end
  
  describe "#kills_report" do
    it "generates report" do
      expect(game.kills_report).to eq "**********\n#{game.name}: {\n\ttotal_kills: 0,\n\tplayers: [],\n\tkills: {\n\t}\n}\n**********\n"
    end
  end
  
  describe "#kill_by_means_report" do
    it "generates report" do
      expect(game.kill_by_means_report).to eq "**********\n#{game.name}: {\n\tkill_by_means: {\n\t}\n}\n**********\n"
    end
  end
end