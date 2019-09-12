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
      if all_x?(horizontal_row_at(i, board)) ||
         all_x?(vertical_column_at(i, board))
        status = :x_wins
      end
    end

    { board: board, status: status }
  end

  private

  def all_x?(line)
    line == [:x]*3
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
