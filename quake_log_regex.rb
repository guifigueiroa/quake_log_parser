module QuakeLogRegex

  INITGAME_REGEX = /[0-9]{1,2}:[0-9]{2} InitGame:.*$/
  SHUTDOWNGAME_REGEX = /[0-9]{1,2}:[0-9]{2} ShutdownGame:$/

  def self.init_game?(line)
    line =~ INITGAME_REGEX
  end
  
  def self.shutdown_game?(line)
    line =~ SHUTDOWNGAME_REGEX
  end
  
  def self.kill?(line)

  end
  
  def self.kill_details(line)

  end
  
  def self.player_connected?(line)

  end
  
  def self.player_connected_details(line)

  end
end