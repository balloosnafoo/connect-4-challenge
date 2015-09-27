class Player
  attr_reader :color

  def initialize(color)
    @color = color
  end

  def take_turn
    print "Please enter the column number in which you will place your piece: "
    gets.chomp.to_i - 1
  end
end
