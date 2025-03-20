class Player
  attr_reader :name, :symbol
  def initialize(name, symbol, id)
    @name = name
    @symbol = symbol
    @id = id
  end
  def info
    puts "PLAYER #{@id} | Name: #{@name}, Symbol: #{@symbol}."
  end
end
