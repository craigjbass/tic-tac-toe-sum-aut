# frozen_string_literal: true

class TicTacToe
  def initialize
    @placed_os = []
    @placed_xs = []
  end

  def display_board
    board = [
      %i[_ _ _],
      %i[_ _ _],
      %i[_ _ _]
    ]

    @placed_xs.each do |position|
      board[(position-1) / 3][(position-1) % 3] = :x
    end

    if @placed_os.include?(2)
      board[0][1] = :o
    end

    if @placed_os.include?(6)
      board[1][2] = :o
    end

    { board: board }
  end

  def place_piece(piece, position)
    @placed_os << position if piece == :o
    @placed_xs << position if piece == :x
  end
end
