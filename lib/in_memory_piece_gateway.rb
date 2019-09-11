class InMemoryPieceGateway
  def initialize
    @pieces = []
  end

  def save_piece(piece)
    @pieces << piece
  end

  def pieces
    @pieces
  end
end
