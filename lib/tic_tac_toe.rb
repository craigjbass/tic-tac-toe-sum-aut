# frozen_string_literal: true

require 'piece'
require 'display_board'
require 'place_piece'

class TicTacToe
  def initialize(display_board, place_piece)
    @display_board = display_board
    @place_piece = place_piece
  end

end
