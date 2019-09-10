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

    @placed_pieces.each do |position, piece|
      board[(position-1) / 3][(position-1) % 3] = piece
    end

    { board: board }
  end

  def place_piece(piece, position)
    @placed_pieces << [position, piece]
  end
end
