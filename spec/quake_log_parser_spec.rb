require_relative 'spec_helper'

describe QuakeLogRegex do
  let (:log) do
       [
          "12:13 InitGame: \\sv_floodProtect\\1\\sv_maxPing\\0\\sv_minPing\\0\\sv_maxRate\\10000\\sv_minRate\\0\\sv_hostname\\Code Miner Server\\g_gametype\\0\\sv_privateClients\\2\\sv_maxclients\\16\\sv_allowDownload\\0\\bot_minplayers\\0\\dmflags\\0\\fraglimit\\20\\timelimit\\15\\g_maxGameClients\\0\\capturelimit\\8\\version\\ioq3 1.36 linux-x86_64 Apr 12 2009\\protocol\\68\\mapname\\q3dm17\\gamename\\baseq3\\g_needpass\\0",
          "12:14 ClientUserinfoChanged: 2 n\\Dono da Bola\\t\\0\\model\\sarge\\hmodel\\sarge\\g_redteam\\\\g_blueteam\\\\c1\\4\\c2\\5\\hc\\95\\w\\0\\l\\0\\tt\\0\\tl\\0",
          "12:14 ClientUserinfoChanged: 3 n\\Isgalamido\\t\\0\\model\\uriel/zael\\hmodel\\uriel/zael\\g_redteam\\\\g_blueteam\\\\c1\\5\\c2\\5\\hc\\100\\w\\0\\l\\0\\tt\\0\\tl\\0",
          "12:14 ClientUserinfoChanged: 4 n\\Zeh\\t\\0\\model\\sarge/default\\hmodel\\sarge/default\\g_redteam\\\\g_blueteam\\\\c1\\1\\c2\\5\\hc\\100\\w\\0\\l\\0\\tt\\0\\tl\\0",
          "12:14 ClientUserinfoChanged: 5 n\\Assasinu Credi\\t\\0\\model\\sarge\\hmodel\\sarge\\g_redteam\\\\g_blueteam\\\\c1\\4\\c2\\5\\hc\\100\\w\\0\\l\\0\\tt\\0\\tl\\0",
          "13:36 ClientUserinfoChanged: 2 n\\Zeh\\t\\0\\model\\sarge/default\\hmodel\\sarge/default\\g_redteam\\\\g_blueteam\\\\c1\\1\\c2\\5\\hc\\100\\w\\0\\l\\0\\tt\\0\\tl\\0",
          "13:37 ClientUserinfoChanged: 2 n\\Zeh\\t\\0\\model\\sarge/default\\hmodel\\sarge/default\\g_redteam\\\\g_blueteam\\\\c1\\1\\c2\\5\\hc\\100\\w\\0\\l\\0\\tt\\0\\tl\\0",
          "14:02 Kill: 1022 5 22: <world> killed Assasinu Credi by MOD_TRIGGER_HURT",
          "14:15 Kill: 2 5 10: Zeh killed Assasinu Credi by MOD_RAILGUN",
          "14:29 Kill: 5 5 7: Assasinu Credi killed Assasinu Credi by MOD_ROCKET_SPLASH",
          "14:38 Kill: 1022 5 22: <world> killed Assasinu Credi by MOD_TRIGGER_HURT",
          "14:46 Kill: 5 2 6: Assasinu Credi killed Zeh by MOD_ROCKET",
          "15:06 Kill: 5 2 6: Assasinu Credi killed Zeh by MOD_ROCKET",
          "15:18 Kill: 2 5 7: Zeh killed Assasinu Credi by MOD_ROCKET_SPLASH",
          "15:27 Kill: 1022 5 22: <world> killed Assasinu Credi by MOD_TRIGGER_HURT",
          "15:36 Kill: 5 5 7: Assasinu Credi killed Assasinu Credi by MOD_ROCKET_SPLASH",
          "15:38 Kill: 1022 2 22: <world> killed Zeh by MOD_TRIGGER_HURT",
          "15:54 Kill: 5 2 6: Assasinu Credi killed Zeh by MOD_ROCKET",
          "16:46 Kill: 1022 5 22: <world> killed Assasinu Credi by MOD_TRIGGER_HURT",
          "16:46 ShutdownGame:",
          "16:46 ------------------------------------------------------------"
         ]
  end
  
  describe "#parse_game" do
    it "parses game correctly" do
      game = QuakeLogParser.parse_game(log).first
      expect(game.kills).to include :"Assasinu Credi" => 1
      expect(game.kills).to include Zeh: 1
      expect(game.kills).not_to include :"<world>"
      expect(game.players).to eq ["Dono", "Isgalamido", "Zeh", "Assasinu"]
      expect(game.kill_by_means).to include MOD_TRIGGER_HURT: 5
      expect(game.kill_by_means).to include MOD_RAILGUN: 1
      expect(game.kill_by_means).to include MOD_ROCKET_SPLASH: 3
      expect(game.kill_by_means).to include MOD_ROCKET: 3
    end
  end
end