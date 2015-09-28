# Configure game here
HEIGHT     = 10
WIDTH      = 10
WIN_LENGTH = 4

require './lib/game'

cf = ConnectFour.new(HEIGHT, WIDTH, WIN_LENGTH)
cf.play
