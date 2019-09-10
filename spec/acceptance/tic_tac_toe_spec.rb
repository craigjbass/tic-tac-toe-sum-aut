# frozen_string_literal: true

require 'tic_tac_toe'

describe 'tic tac toe' do
  class InMemoryPieceGateway
    def initialize
      @placed_pieces = []
    end

    def pieces
      @placed_pieces.map(&:dup) 
    end

    def save_piece(piece)
      @placed_pieces << piece
    end
  end

  let(:piece_gateway) { InMemoryPieceGateway.new }

  it 'can display an empty board' do
    tic_tac_toe = TicTacToe.new(piece_gateway)

    response = tic_tac_toe.display_board

    expect(response[:board]).to(
      eq(
        [
          %i[_ _ _],
          %i[_ _ _],
          %i[_ _ _]
        ]
      )
    )
  end

  it 'can place a piece' do
    tic_tac_toe = TicTacToe.new(piece_gateway)

    tic_tac_toe.place_piece(:x, 1)

    expect(tic_tac_toe.display_board[:board]).to(
      eq(
        [
          %i[x _ _],
          %i[_ _ _],
          %i[_ _ _]
        ]
      )
    )
  end

  it 'can place two pieces' do
    tic_tac_toe = TicTacToe.new(piece_gateway)

    tic_tac_toe.place_piece(:x, 1)
    tic_tac_toe.place_piece(:o, 2)

    expect(tic_tac_toe.display_board[:board]).to(
      eq(
        [
          %i[x o _],
          %i[_ _ _],
          %i[_ _ _]
        ]
      )
    )
  end

  it 'can place three pieces' do
    tic_tac_toe = TicTacToe.new(piece_gateway)

    tic_tac_toe.place_piece(:x, 1)
    tic_tac_toe.place_piece(:o, 2)
    tic_tac_toe.place_piece(:x, 3)

    expect(tic_tac_toe.display_board[:board]).to(
      eq(
        [
          %i[x o x],
          %i[_ _ _],
          %i[_ _ _]
        ]
      )
    )
  end

  it 'can place four pieces' do
    tic_tac_toe = TicTacToe.new(piece_gateway)

    tic_tac_toe.place_piece(:x, 1)
    tic_tac_toe.place_piece(:o, 2)
    tic_tac_toe.place_piece(:x, 3)
    tic_tac_toe.place_piece(:o, 6)

    expect(tic_tac_toe.display_board[:board]).to(
      eq(
        [
          %i[x o x],
          %i[_ _ o],
          %i[_ _ _]
        ]
      )
    )
  end

  it 'can place five pieces' do
    tic_tac_toe = TicTacToe.new(piece_gateway)

    tic_tac_toe.place_piece(:x, 1)
    tic_tac_toe.place_piece(:o, 2)
    tic_tac_toe.place_piece(:x, 3)
    tic_tac_toe.place_piece(:o, 6)
    tic_tac_toe.place_piece(:x, 7)

    expect(tic_tac_toe.display_board[:board]).to(
      eq(
        [
          %i[x o x],
          %i[_ _ o],
          %i[x _ _]
        ]
      )
    )
  end

  it 'can persist moves' do
    TicTacToe.new(piece_gateway).tap do |tic_tac_toe|
      tic_tac_toe.place_piece(:x, 1)
      tic_tac_toe.place_piece(:o, 2)
      tic_tac_toe.place_piece(:x, 3)
      tic_tac_toe.place_piece(:o, 6)
      tic_tac_toe.place_piece(:x, 7)
    end

    TicTacToe.new(piece_gateway).tap do |tic_tac_toe|
      expect(tic_tac_toe.display_board[:board]).to(
        eq(
          [
            %i[x o x],
            %i[_ _ o],
            %i[x _ _]
          ]
        )
      )
    end
  end
end
