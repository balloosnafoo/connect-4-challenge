require 'colorize'
require 'byebug'

class Board
  VECTORS = [
    [-1, -1],
    [-1,  0],
    [ 1, -1],
    [ 0, -1]
  ]

  def initialize(width, height, win_length)
    @grid = generate_grid(width, height)
    @win_length = win_length
    @width = width
    @height = height
  end

  def generate_grid(width, height)
    Array.new(height) { Array.new(width) }
  end

  def execute_move(col_num, color)
    place_piece(col_num, color)
    winning_move?(col_num, color)
  end

  def place_piece(col_num, color)
    return false unless is_valid?(col_num)
    @grid.each_with_index do |row, idx|
      # place piece above if  current row is occupied
      if row[col_num]
        @grid[idx - 1][col_num] = color
        break
      end
      # place piece if current row is last
      @grid[idx][col_num] = color if idx == @height - 1
    end
  end

  def winning_move?(col_idx, color)
    row_idx = highest_occupied_row(col_idx)
    original_position = [row_idx, col_idx]
    VECTORS.each do |vector|
      row_idx, col_idx = last_contiguous_on_vector(
        vector, row_idx, col_idx, color
      )
      if @win_length <= num_contiguous_on_vector(vector, row_idx, col_idx, color)
        return true
      end
      row_idx, col_idx = original_position
    end
    false
  end

  def last_contiguous_on_vector(vector, row_idx, col_idx, color)
    while @grid[row_idx] && @grid[row_idx][col_idx] == color
      row_idx += vector[0]
      col_idx += vector[1]
    end
    row_idx -= vector[0]
    col_idx -= vector[1]

    [row_idx, col_idx]
  end

  def num_contiguous_on_vector(vector, row_idx, col_idx, color)
    counter = 0
    while @grid[row_idx] && @grid[row_idx][col_idx] == color
      counter += 1
      row_idx -= vector[0]
      col_idx -= vector[1]
    end
    counter
  end

  def is_valid?(col_num)
    # if 0th row is occupied, col is full
    return false if @grid[0][col_num]
    # row is out of range
    (0...@width).include?(col_num)
  end

  def highest_occupied_row(col_idx)
    @grid.each_with_index { |row, idx| return idx if row[col_idx] }
  end

  def render
    str_arr = []
    (0...@height).each do |row_idx|
      (0...@width).each do |col_idx|
        color = self[[row_idx, col_idx]]
        str_arr << ( color ? "O".colorize(color) : " " )
      end
      puts str_arr.join(" | ")
      str_arr = []
    end
    puts (1..@height).to_a.join("   ")
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end
end
