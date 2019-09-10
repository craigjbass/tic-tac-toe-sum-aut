# frozen_string_literal: true

require 'piece'
require 'display_board'
require 'place_piece'

class TicTacToe
  def initialize(piece_gateway, display_board, place_piece)
    @piece_gateway = piece_gateway
    @display_board = display_board || DisplayBoard.new(piece_gateway)
    @place_piece = place_piece || PlacePiece.new(piece_gateway)
  end

  def display_board
    @display_board.execute({})
  end

  def place_piece(type, position)
    @place_piece.execute(position: position, type: type)
  end
end
