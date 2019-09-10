# frozen_string_literal: true

require 'piece'

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
