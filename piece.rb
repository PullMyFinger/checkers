class Pieces
  attr_accessor :pos, :king

  #first num is row second is column
  #black is always at top of board & red at bottom
  BLACK_MOVE_DIRS = [
    [1, -1],
    [1, 1]
  ]
  RED_MOVE_DIRS = [
    [-1, -1],
    [-1, 1]
  ]

  def initialize(color, pos, board)
    @color, @pos, @board = color, pos, board
    @king = false
  end

  def perform_slide(target_pos)
    #if worked return true else false

  end

  def perform_jump(target_pos)
    #if worked return true else false
  end

  def legal_move?(target_pos)
    #self.pos
    #is target empty?
    #is occupied by other color?
    #occupied by same color?
  end

  def move_diffs(dirs)
    potential_moves = []
    #self.pos
    #itterate through dirs add each dir to current piece pos
    #push each new pos into potential moves
    #return potential moves
  end

  def maybe_promote
    #checks to see if new pos is now on opposite side of the board
  end

  def perform_moves(move_sequence)
    #takes pos and checks for valid moves
    #at each valid move again checks for valid from new pos
    #until no more valid moves
  end
end
