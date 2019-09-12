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

    if all_x?(horizontal_row_at(0, board))
      status = :x_wins
    end

    if all_x?(horizontal_row_at(1, board))
      status = :x_wins
    end

    if all_x?(horizontal_row_at(2, board))
      status = :x_wins
    end

    if board[0][0] == :x && board[1][0] == :x && board[2][0] == :x
      status = :x_wins
    end

    if board[0][1] == :x && board[1][1] == :x && board[2][1] == :x
      status = :x_wins
    end

    if board[0][2] == :x && board[1][2] == :x && board[2][2] == :x
      status = :x_wins
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
end
