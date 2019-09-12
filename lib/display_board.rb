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

    if board[1][0] == :x
      status = :x_wins
    end

    { board: board, status: status }
  end
end
