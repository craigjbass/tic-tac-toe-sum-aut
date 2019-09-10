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

    @placed_xs.zip([:x]*@placed_xs.length).each do |position, x|
      board[(position-1) / 3][(position-1) % 3] = x
    end

    @placed_os.each do |position|
      board[(position-1) / 3][(position-1) % 3] = :o
    end

    { board: board }
  end

  def place_piece(piece, position)
    @placed_os << position if piece == :o
    @placed_xs << position if piece == :x
  end
end
