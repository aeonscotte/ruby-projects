class Board
   attr_accessor :grid
   def initialize
      @s = 3
      @grid = Array.new(@s){Array.new(@s,' ')}
   end
   def print_grid
      puts "     A   B   C   
   ┌───┬───┬───┐
1  │ #{@grid[0][0]} │ #{@grid[0][1]} │ #{@grid[0][2]} │
   │───│───│───│
2  │ #{@grid[1][0]} │ #{@grid[1][1]} │ #{@grid[1][2]} │
   │───│───│───│
3  │ #{@grid[2][0]} │ #{@grid[2][1]} │ #{@grid[2][2]} │
   └───┴───┴───┘"
  end
end
