require_relative './models/board'
require_relative './models/player'
require_relative './views/load_anim'
require_relative './models/score_board'
require_relative './views/vista'

class Game
  @@id = 1
  def initialize
    @id = @@id
    @@id += 1
  end
  def info
    puts "Game ##{@id}"
  end

  def play
    anim = LoadAnimation.new
    anim.banner; sleep(0.1)
    anim.rot("\n\n         LOADING...")
    puts "Welcome! Player 1 enter your name:"
    @p1 = Player.new(gets.chomp, 'X', 1)
    puts "You will be playing as X.\n"
    sleep(1); system "clear"; sleep(0.1)
    puts "Player 2 enter your name:"
    @p2 = Player.new(gets.chomp, 'O', 2)
    puts "You will be playing as O.\n"
    sleep(1); system "clear"; sleep(0.1)
    anim.rot("\n\n         Preparing game...")

    s = ScoreBoard.new(@p1.name, @p2.name)
    cp = @p1
    
    replay = true
    while replay
      gameboard = Board.new
      game_over = false
      while !game_over
        input_flag = false
        while !input_flag
          system "clear"
          gameboard.print_grid
          sleep(0.1)
          puts "It is #{cp.name}'s turn. \nEnter coordinates:"
          coords = gets.split('')
          input_flag = check_coords(coords, gameboard)
        end
        gameboard.grid[get_row(coords)][get_col(coords)] = cp.symbol
        game_over = check_win(gameboard.grid)
        cp = switch_players(cp)  
      end
      cp = switch_players(cp)

      while replay
        system "clear"; gameboard.print_grid
        puts"\n   #{cp.name} wins!!!"; sleep(3); system "clear"
        # RESULT SCREEN
        info; puts" "
        s.scores[cp.name] += 1
        s.print_scores
        puts "PLAY AGAIN? (Y/N)"
        prompt = gets.chomp.downcase
        case prompt
        when "y"
          replay = true
          cp = switch_players(cp)
          @@id += 1
          break
        when "n"
          replay = false
          system "clear"
          puts "\n\n         Exiting..."
          sleep(1); system "clear"
        else
          replay = true
        end
      end
    end
  end

  def check_win(grid)
    wins = [
      grid[0][0] == grid[0][1] && grid[0][0] == grid[0][2] && grid[0][0] != ' ',
      grid[1][0] == grid[1][1] && grid[1][0] == grid[1][2] && grid[1][0] != ' ',
      grid[2][0] == grid[2][1] && grid[2][0] == grid[2][2] && grid[2][0] != ' ',
      grid[0][0] == grid[1][0] && grid[0][0] == grid[2][0] && grid[0][0] != ' ',
      grid[0][1] == grid[1][1] && grid[0][1] == grid[2][1] && grid[0][1] != ' ',
      grid[0][2] == grid[1][2] && grid[0][2] == grid[2][2] && grid[0][2] != ' ',
      grid[0][0] == grid[1][1] && grid[0][0] == grid[2][2] && grid[0][0] != ' ',
      grid[0][2] == grid[1][1] && grid[0][2] == grid[2][0] && grid[0][2] != ' ',
    ]
    wins.any?
  end

  def check_coords(coords, board)
    if !(/[A-C]/.match(coords[0]) && coords[1].to_i > 0 && coords[1].to_i <= 3)
      puts "Invalid input."; sleep(1)
      false
    elsif board.grid[get_row(coords)][get_col(coords)] != ' '
      puts "The cell is occupied! Try another."; sleep(1)
      false
    else
      true
    end
  end

  def switch_players(p)
    p.name == @p1.name ? @p2 : @p1
  end

  def get_row(coords)
    coords[1].to_i - 1
  end

  def get_col(coords)
    c = coords[0]
    case c
    when "A"
       0
    when "B" 
      1
    else 
      2
    end
  end
end
