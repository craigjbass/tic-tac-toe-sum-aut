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

    if @placed_xs.include?(1)
      board[0][0] = :x
    end

    if @placed_xs.include?(3)
      board[0][2] = :x
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
    if piece == :o
      @placed_os << position
      if position == 2
        @placed_o = true
      end

      if position == 6
        @placed_o_6 = true
      end
    end
    if piece == :x
      @placed_xs << position
      if position == 1
        @placed = true
      end

      if position == 3
        @placed_x_3 = true
      end
    end
  end
end
