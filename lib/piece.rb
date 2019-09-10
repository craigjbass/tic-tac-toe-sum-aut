class Piece
  attr_accessor :position, :type

  def row
    (position - 1) / 3
  end

  def column
    (position - 1) % 3
  end
end
