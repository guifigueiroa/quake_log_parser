require_relative 'quake_log_regex'
require_relative 'quake_log_parser'
require_relative 'game'

log = File.readlines("games.log")
games = QuakeLogParser.parse_game log

