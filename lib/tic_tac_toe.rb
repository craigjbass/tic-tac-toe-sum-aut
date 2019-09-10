# frozen_string_literal: true

class TicTacToe
  class GameState
    attr_accessor :placed_pieces

    def pieces
      @placed_pieces
    end

    def save_piece(piece)
      @placed_pieces << piece
    end
  end

  def initialize
    @game_state = GameState.new
    @game_state.placed_pieces = []
  end

  def display_board
    board = [
      %i[_ _ _],
      %i[_ _ _],
      %i[_ _ _]
    ]

    @game_state.pieces.each do |position, piece|
      board[(position-1) / 3][(position-1) % 3] = piece
    end

    { board: board }
  end

  def place_piece(piece, position)
    @game_state.save_piece([position, piece])
  end
end
