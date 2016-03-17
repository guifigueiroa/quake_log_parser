require_relative 'quake_log_regex'
require_relative 'quake_log_parser'
require_relative 'game'

log = File.readlines("games.log")
games = QuakeLogParser.parse_game log

while(true) do
  puts "-"*50
  puts "Log file contains #{games.count} games played."
  puts "Which game do you want to consult? (Between 1 and #{games.count}, anything else to exit)"

  option = gets.to_i

  if option < 1 || option > games.count
    abort
  end

  game = games[option - 1]

  puts "\nWhat report do you want to generate?"
  puts "1 - Kills report"
  puts "2 - Kill by means report"

  option = gets.to_i

  if option == 1
    puts game.kills_report
  elsif option == 2
    puts game.kill_by_means_report
  else
    puts "Invalid option"
  end
end
