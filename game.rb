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
  
  def add_kill(player, mean)
    @total_kills += 1
    
    # initialize hashes
    @kills[player.to_sym] ||= 0
    @kill_by_means[mean.to_sym] ||= 0
    
    # increments hashes
    @kills[player.to_sym] += 1
    @kill_by_means[mean.to_sym] += 1
  end
end