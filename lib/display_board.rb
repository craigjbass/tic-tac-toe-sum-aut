# frozen_string_literal: true

class DisplayBoard
  def initialize(piece_gateway)
    @piece_gateway = piece_gateway
  end

  def execute(_request)
    board = [
      [:_, :_, :_],
      [:_, :_, :_],
      [:_, :_, :_]
    ]

    @piece_gateway.pieces.each do |piece|
      board[piece.row][piece.column] = piece.type
    end

    { board: board }
  end
end
