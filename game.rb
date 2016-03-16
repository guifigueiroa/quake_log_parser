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
  end
end