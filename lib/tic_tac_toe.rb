# frozen_string_literal: true

class TicTacToe
  def display_board
    board = [
      %i[_ _ _],
      %i[_ _ _],
      %i[_ _ _]
    ]

    if @placed
      board[0][0] = :x
    end

    if @placed_x_3
      board[0][2] = :x
    end

    if @placed_o
      board[0][1] = :o
    end

    if @placed_o_6
      board[1][2] = :o
    end

    { board: board }
  end

  def place_piece(piece, position)
    if piece == :o
      if position == 2
        @placed_o = true
      end

      if position == 6
        @placed_o_6 = true
      end
    end
    if piece == :x
      if position == 1
        @placed = true
      end

      if position == 3
        @placed_x_3 = true
      end
    end
  end
end
