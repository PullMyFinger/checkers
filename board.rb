class Board
  attr_reader :grid
  def initialize
    @grid = Array.new(8) { Array.new(8, nil) }
  end

  def populate_grid
    #iterate over grid and fill with pieces
  end

  def occupied?(target)

  end

  def on_board?(target)
    #use rubies between? method
  end

  def render
    print " "
    (0..7).each do |num| print "  #{num}" end
    puts ""
    n = 0

    grid.each do |row|
      print "#{n} "
      row.each do |piece|
        if piece.nil?
          print " - "
        else
          print " #{piece.inspect} "
        end
      end
      n += 1
      puts "\n"
    end
  end

  def display
    render
  end
end
