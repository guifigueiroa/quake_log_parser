module QuakeLogRegex

  INFO_CHANGED_REGEX = /[0-9]{1,2}:[0-9]{2} ClientUserinfoChanged: (\d+) n\\(\w+).*/
  INITGAME_REGEX = /[0-9]{1,2}:[0-9]{2} InitGame:.*$/
  KILL_REGEX = /[0-9]{1,2}:[0-9]{2} Kill: (\d+) (\d+) (\d+): (<?[\w|\s]+>?) killed ([\w|\s]+) by ([A-Z|_]*)$/
  #SHUTDOWNGAME_REGEX = /[0-9]{1,2}:[0-9]{2} ShutdownGame:$/
  SHUTDOWNGAME_REGEX = /.*[0-9]{1,2}:[0-9]{2} -+$/

  def self.init_game?(line)
    line =~ INITGAME_REGEX
  end
  
  def self.shutdown_game?(line)
    line =~ SHUTDOWNGAME_REGEX
  end
  
  def self.kill?(line)
    line =~ KILL_REGEX
  end
  
  def self.kill_details(line)
    if line =~ KILL_REGEX
      { killer: $4,
        killed: $5,
        by: $6
        }
    end
  end
  
  def self.player_connected?(line)
    line =~ INFO_CHANGED_REGEX
  end
  
  def self.player_connected_details(line)
    if line =~ INFO_CHANGED_REGEX
      $2
    end
  end
end