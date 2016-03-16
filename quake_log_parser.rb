module QuakeLogParser
  
  def self.parse_game(log)
    games = []
    game = nil
    
    log.each do |line|
      # game init pattern
      game = Game.new if QuakeLogRegex.init_game? line
      
      # player connected pattern
      if QuakeLogRegex.player_connected? line
        player = QuakeLogRegex.player_connected_details line
        game.add_player player
      end
      
      # game kill pattern
      if QuakeLogRegex.kill? line
        kill = QuakeLogRegex.kill_details line
        game.add_kill kill[:killer], kill[:killed], kill[:by]
      end
      
      # game shutdown pattern
      games << game if QuakeLogRegex.shutdown_game?(line) && !game.nil?
    end
    
    games
  end
end