class ScoreBoard
  attr_accessor :scores
  def initialize(player1, player2)
    @scores = Hash.new
    @scores[player1] = 0
    @scores[player2] = 0
  end
  def print_scores
    puts "   " + " " * @scores.keys[0].length + "SCORE" + " " * @scores.keys[1].length + "   "
    puts "┌──" + "─" * @scores.keys[0].length + "──┬──" + "─" * @scores.keys[1].length + "──┐"
    puts "│  #{@scores.keys[0]}  │  #{@scores.keys[1]}  │"
    puts "│──" + "─" * @scores.keys[0].length + "──│──" + "─" * @scores.keys[1].length + "──│"
    puts "│  " + " " * (@scores.keys[0].length-2) + "#{@scores.values[0]}   " + "│  " + " " * (@scores.keys[1].length-2) + "#{@scores.values[1]}   │"
    puts "└──" + "─" * @scores.keys[0].length + "──┴──" + "─" * @scores.keys[1].length + "──┘"
  end
end