# frozen_string_literal: true

class TicTacToe
  def initialize
    @placed_pieces = []
  end

  def display_board
    board = [
      %i[_ _ _],
      %i[_ _ _],
      %i[_ _ _]
    ]

    pieces.each do |position, piece|
      board[(position-1) / 3][(position-1) % 3] = piece
    end

    { board: board }
  end

  def place_piece(piece, position)
    save_piece([position, piece])
  end

  private

  def pieces
    @placed_pieces
  end

  def save_piece(piece)
    @placed_pieces << piece
  end
end
