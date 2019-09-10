# frozen_string_literal: true

class PlacePiece
  def initialize(piece_gateway)
    @piece_gateway = piece_gateway
  end

  def execute(request)
    piece = Piece.new
    piece.position = request[:position]
    piece.type = request[:type]
    @piece_gateway.save_piece(piece)
  end
end
