# frozen_string_literal: true

require 'piece'
require 'display_board'
require 'place_piece'

class TicTacToe
  def initialize(piece_gateway)
    @piece_gateway = piece_gateway
  end

  def display_board
    DisplayBoard.new(@piece_gateway).execute({})
  end

  def place_piece(type, position)
    PlacePiece.new(@piece_gateway).execute(position: position, type: type)
  end
end
