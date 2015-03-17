#require 'minitest/autorun'
 
class GameOfLife  
   
  attr_reader :matrix
 
  #==========SET UP GAME MATRIX
  def initialize(rows, columns, input)
    @matrix = rows.times.map do |y| 
      columns.times.map do |x| 
        Cell.new(self, x, y, rand(input).to_i.even?)
      end
    end
  end
  
  #==========GAME ENGINE ON INFINITE LOOP
  def play
    while(true)
      system('clear')
      render_board
      board_update
      sleep(5)
    end
  end

  #======= METHOD ONLY USED TO VALIDATE TESTS
  def play_test

    cel = [cell_location(2, 2), cell_location(3, 2), cell_location(4, 2),
    cell_location(2, 3  ),                       cell_location(4, 3  ),
    cell_location(2, 4), cell_location(3, 4), cell_location(4, 4)]
    #STILL NEED TO FINISH TESTING ENTIRELY

    puts cell_location(3, 3)
    render_board
    board_update
    puts cell_location(3, 3)
  end
 
  #============DISPLAYS BOARD RESULTS
  def render_board
    board_row = "%" * (matrix.first.size * 2 + 3)
    [
      "\n"*4,
      board_row,
      matrix.map{|row| "% " + row.join(" ") + " %" },
      board_row,
    ].flatten.each do |line| 
      puts line
    end
  end
 
  #================UPDATES BOARD RESULTS FOR NEXT ROUND
  def board_update
    matrix.each do |row|
      row.each do |cell|
        cell.board_updates
      end
    end
  end
  
  #================CELL LOCATIONS
  def cell_location(x, y)
    matrix.fetch(y){[]}[x]
  end
end
 
class Cell
 
  attr_reader :x, :y, :game, :living, :neighbors
  
  #==================INITIALIZES STATES OF EACH CELL
  def initialize(game, x, y, state)
    @game = game
    @x = x
    @y = y
    @living = state
  end
  
  def dead
    @living = false
  end
  
  def rebirth
    @living = true
  end
  
  def is_cell_alive?
    @living == true
  end
 
  def dead?
    !is_cell_alive?
  end
  
  #================DEFINES NEIGHBORING CELLS
  def neighbors
    @neighbors ||= begin
      [
        game.cell_location(x-1, y-1), game.cell_location(x, y-1), game.cell_location(x+1, y-1),
        game.cell_location(x-1, y  ),                       game.cell_location(x+1, y  ),
        game.cell_location(x-1, y+1), game.cell_location(x, y+1), game.cell_location(x+1, y+1)
      ].compact
    end
  end
  
  def live_neighbors
    neighbors.select(&:is_cell_alive?)
  end
  
  def under_populated?
    is_cell_alive? and live_neighbors.size < 2
  end  
  
  def over_populated?
    is_cell_alive? and live_neighbors.size > 3  
  end  
  
  def to_be_reproduced?
    dead? and live_neighbors.size == 3  
  end
 
  #===============UPDATES THE STATUS OF EACH CELL
  def board_updates
    if under_populated? 
      dead
    elsif over_populated?
      dead
    elsif to_be_reproduced?
      rebirth
    end  
  end
  
  def to_s
    is_cell_alive? ? "x" : " "
  end
end

#================INITIATE GAME PLAY(COMMENTED OUT TO ALLOW FOR TESTING)
#new_game = GameOfLife.new(10,10,Time.now.to_i)
#new_game.play
#new_game.play_test

class GameOfLifeTesting < Minitest::Test
  def test_hacker
    new_game = GameOfLife.new(10,10,Time.now.to_i)
    refute_empty new_game.matrix
  end
end







