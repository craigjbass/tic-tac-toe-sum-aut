class PlacePiece
  def initialize(piece_gateway)
    @piece_gateway = piece_gateway
  end

  def execute(request)
    @piece_gateway.save_piece(
      Piece.new.tap do |p|
        p.position = request[:position]
        p.type = request[:type]
      end
    )
  end
end
