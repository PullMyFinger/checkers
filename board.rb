require 'colorize'
require_relative 'piece'

class Board
  attr_reader :grid


  def initialize(pop = true)
    @grid = Array.new(8) { Array.new(8){nil} }
    generate_board if pop
  end

  # Fills the board with b on top w on bottom
  def generate_board
    [0, 1, 2].each do |row|
      0.upto(7) do |col|
        offset = row + col
        self[[row, col]] = Piece.new([row, col], self, :B) if offset.odd?
      end
    end

    [5, 6, 7].each do |row|
      0.upto(7) do |col|
        offset = row + col
        self[[row, col]] = Piece.new([row, col], self, :W) if offset.odd?
      end
    end
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    grid[row][col] = value
  end

  def empty?(pos)
    self[pos] == nil
  end

  def deep_dup
    new_board = Board.new(false)

    grid.flatten.compact.each do |piece|
      new_board[piece.pos.dup] =
          Piece.new(piece.pos.dup, new_board, piece.color)
    end

    new_board
  end
  def display
    puts render
  end

  def render
    display_str = "  0 1 2 3 4 5 6 7 \n"
    @grid.each_with_index do |row, i|
      display_str += "#{i.to_s} "
      row.each_with_index do |tile, index|
        if i.even? && index.even? || index.odd? && i.odd?
          color_tile = :light_white
        else
          color_tile = :pink
        end
          if tile.nil?
            display_str += "  ".colorize(:background => color_tile)
          else
            display_str +="#{tile.symbol} ".colorize(:background => color_tile)
          end
        end
      display_str += "\n"
    end
    display_str
  end
end

b = Board.new
b.display

# I am so hungry!!!
# no I'm not
