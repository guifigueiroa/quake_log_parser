class Game
  attr_reader :name, :total_kills, :players, :kills, :kill_by_means
  @@instance_count = 0
  
  def initialize
    @@instance_count += 1
    @name = "game_#{@@instance_count}"
    @total_kills = 0
    @players = []
    @kills = {}
    @kill_by_means = {}
  end
  
  def add_player(player)
    @players << player unless @players.include? player
  end
  
  def add_kill(killer, killed, mean)
    @total_kills += 1
    
    # initialize hashes
    @kills[killer.to_sym] ||= 0 unless killer == "<world>"
    @kills[killed.to_sym] ||= 0
    @kill_by_means[mean.to_sym] ||= 0
    
    # increments hashes
    if killer == "<world>"
      @kills[killed.to_sym] -= 1
    else
      @kills[killer.to_sym] += 1
    end
    
    @kill_by_means[mean.to_sym] += 1
  end
  
  def to_hash
    hash = Hash.new
    hash[:"#{@name}"] = {
      total_kills: @total_kills,
      players: @players,
      kills: @kills
      }
    hash
  end
  
  def kill_by_means_hash
    hash = Hash.new
    hash[:"#{@name}"] = {
      kill_by_means: @kill_by_means.sort_by{|_key, value| value}.reverse.to_h
      }
    hash
  end
end