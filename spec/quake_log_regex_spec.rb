require_relative 'spec_helper'

describe QuakeLogRegex do
  let (:log) do
       [
          "0:00 InitGame: \\sv_floodProtect\\1\\sv_maxPing\\0\\sv_minPing\\0\\sv_maxRate\\10000\\sv_minRate\\0\\sv_hostname\\Code Miner",
          "0:25 ClientConnect: 2",
          "0:27 ClientUserinfoChanged: 2 n\\Mocinha\\t\\0\\model\\sarge\\hmodel\\sarge\\g_redteam\\\\g_blueteam\\\\c1\\4\\c2\\5\\hc\\95\\w\\0\\l\\0\\tt\\0\\tl\\0",
          "0:27 ClientBegin: 2",
          "0:59 ClientConnect: 3",
          "1:01 ClientUserinfoChanged: 3 n\\Isgalamido\\t\\0\\model\\uriel/zael\\hmodel\\uriel/zael\\g_redteam\\\\g_blueteam\\\\c1\\5\\c2\\5\\hc\\100\\w\\0\\l\\0\\tt\\0\\tl\\0",
          "1:01 ClientBegin: 3",
          "1:08 Kill: 3 2 6: Isgalamido killed Mocinha by MOD_ROCKET",
          "1:26 Kill: 1022 4 22: <world> killed Zeh by MOD_TRIGGER_HURT",
          "1:47 ShutdownGame:",
         ]
    end
  
  describe "#init_game" do
    it "matches start game pattern" do
      expect(QuakeLogRegex.init_game?(log.first)).to eq 0
    end
  end
  
  describe "#shutdown_game" do
    it "matches end game pattern" do
      expect(QuakeLogRegex.shutdown_game?(log.last)).to eq 0
    end
  end
  
  describe "#kill" do
    it "matches kill pattern" do
      expect(QuakeLogRegex.kill?(log[7])).to eq 0
    end
    it "gets kill details" do
      kill = QuakeLogRegex.kill_details log[7]
      expect(kill[:killer]).to eq "Isgalamido"
      expect(kill[:killed]).to eq "Mocinha"
      expect(kill[:by]).to eq "MOD_ROCKET"
    end
    it "matches world kill pattern" do
      expect(QuakeLogRegex.kill?(log[8])).to eq 0
    end
    it "gets world kill details" do
      kill = QuakeLogRegex.kill_details log[8]
      expect(kill[:killer]).to eq "<world>"
      expect(kill[:killed]).to eq "Zeh"
      expect(kill[:by]).to eq "MOD_TRIGGER_HURT"
    end
  end
  
  describe "#player_connected" do
    it "matches player connected pattern" do
      expect(QuakeLogRegex.player_connected?(log[2])).to eq 0
    end
    it "gets player connected details" do
      player = QuakeLogRegex.player_connected_details log[2]
      expect(player).to eq "Mocinha"
    end
  end
end