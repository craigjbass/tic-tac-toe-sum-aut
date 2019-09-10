# frozen_string_literal: true

class GameState
  def initialize
    @placed_pieces = []
  end

  def pieces
    @placed_pieces.map do |p|
      Piece.new.tap do |piece|
        piece.position = p[0]
        piece.type = p[1]
      end
    end
  end

  def save_piece(piece)
    @placed_pieces << [piece.position, piece.type]
  end
end

class Piece
  attr_accessor :position, :type
end

class TicTacToe
  def initialize(game_state)
    @game_state = game_state
  end

  def display_board
    board = [
      %i[_ _ _],
      %i[_ _ _],
      %i[_ _ _]
    ]

    @game_state.pieces.each do |piece|
      board[(piece.position-1) / 3][(piece.position-1) % 3] = piece.type
    end

    { board: board }
  end

  def place_piece(type, position)
    @game_state.save_piece(
      Piece.new.tap do |p|
        p.position = position
        p.type = type
      end
    )
  end
end
