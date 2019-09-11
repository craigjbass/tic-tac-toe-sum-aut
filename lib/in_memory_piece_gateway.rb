class InMemoryPieceGateway
  def initialize
    @pieces = []
  end

  def save_piece(piece)
    @pieces << piece
  end

  def pieces
    @pieces.map(&:dup)
  end
end
