# frozen_string_literal: true

require 'piece'
require 'display_board'
require 'place_piece'

class TicTacToe
  def initialize(display_board, place_piece)
    @display_board = display_board 
    @place_piece = place_piece 
  end

  def display_board
    @display_board.execute({})
  end

  def place_piece(type, position)
    @place_piece.execute(position: position, type: type)
  end
end
