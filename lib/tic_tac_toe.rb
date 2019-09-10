# frozen_string_literal: true

class GameState
  def initialize
    @placed_pieces = []
  end

  def pieces
    @placed_pieces.map(&:dup) 
  end

  def save_piece(piece)
    @placed_pieces << piece
  end
end

class Piece
  attr_accessor :position, :type

  def row
    (position - 1) / 3
  end

  def column
    (position - 1) % 3
  end
end

class TicTacToe
  def initialize(piece_gateway)
    @piece_gateway = piece_gateway
  end

  def display_board
    board = [
      %i[_ _ _],
      %i[_ _ _],
      %i[_ _ _]
    ]

    @piece_gateway.pieces.each do |piece|
      board[piece.row][piece.column] = piece.type
    end

    { board: board }
  end

  def place_piece(type, position)
    @piece_gateway.save_piece(
      Piece.new.tap do |p|
        p.position = position
        p.type = type
      end
    )
  end
end
