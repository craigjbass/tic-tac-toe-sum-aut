# frozen_string_literal: true

require 'piece'
require 'display_board'

class TicTacToe
  def initialize(piece_gateway)
    @piece_gateway = piece_gateway
  end

  def display_board
    DisplayBoard.new(@piece_gateway).execute({})
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
