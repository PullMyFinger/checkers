class Piece
  attr_accessor :pos, :king, :symbol
  attr_reader :board, :color

  #first num is row second is column
  #black is always at top of board & white at bottom
  BLACK_DIRS = [
    [1, -1],
    [1, 1]
  ]
  WHITE_DIRS = [
    [-1, -1],
    [-1, 1]
  ]
  PIECE_UNICODE = {
    B: "\u25CF",
    W: "\u25CF"
    }
  KING_UNICODE  = {
    B: "\u25C9",
    W: "\u25C9"
    }

  def initialize(pos, board, color)
    @pos, @board, @color = pos, board, color
    @king = false
    @symbol = '-'
  end

  def perform_slide(end_pos)
    if board.empty?(end_pos) && move_diffs.include?(end_pos)
      board[end_pos] = self
      board[pos] = nil
      @pos = end_pos
      maybe_promote
      true
    else
      false
    end
  end

  def perform_jump(target_pos)
    #if worked return true else false
  end

  def move_diffs
    if king
      poss_moves(BLACK_DIRS + WHITE_DIRS)
    elsif :B
      poss_moves(WHITE_DIRS)
    else
      poss_move(BLACK_DIRS)
    end
  end

  def poss_moves(dirs)
    possible_moves = []
    dirs.each do |row, col|
      new_pos = [pos[0] + row, pos[1] + col]
      if board.empty?(new_pos) || board[new_pos].color != color
        possible_moves << new_pos
      end
    end

    possible_moves
  end

  def maybe_promote
    if color == :B
      self.king = true if back_row?
    else
      self.king = true if back_row?
    end
  end

  def end_row?
    if color == :B
      pos[0] == 7
    else
      pos[0] == 0
    end
  end

  def perform_moves(move_sequence)

  end

  def symbol
    unicode = king ? KING_UNICODE[color] : PIECE_UNICODE[color]
    unicode.colorize(color)
  end
end
