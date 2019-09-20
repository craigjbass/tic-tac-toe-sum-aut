# frozen_string_literal: true

class DisplayBoard
  def initialize(piece_gateway)
    @piece_gateway = piece_gateway
  end

  def execute(_request)
    board = [
      %i[_ _ _],
      %i[_ _ _],
      %i[_ _ _]
    ]

    @piece_gateway.pieces.each do |piece|
      board[piece.row][piece.column] = piece.type
    end

    status = :in_progress

    (0..2).each do |i|
      horizontal_row = horizontal_row_at(i, board)
      vertical_row = vertical_column_at(i, board)

      if all?(:x, horizontal_row) ||
         all?(:x, vertical_row)
        status = :x_wins
      end

      if all?(:o, horizontal_row) ||
         all?(:o, vertical_row)
        status = :o_wins
      end
    end

    { board: board, status: status }
  end

  private

  def all?(type, line)
    line == [type]*3
  end

  def horizontal_row_at(row, board)
    (0..2).reduce([]) do |acc, column|
      acc + [board[row][column]]
    end
  end

  def vertical_column_at(column, board)
    (0..2).reduce([]) do |acc, row|
      acc + [board[row][column]]
    end
  end
end
