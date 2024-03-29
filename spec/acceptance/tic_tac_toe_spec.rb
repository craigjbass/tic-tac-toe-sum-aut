# frozen_string_literal: true

require 'tic_tac_toe'

describe 'tic tac toe' do
  let(:piece_gateway) { InMemoryPieceGateway.new }

  def new_tic_tac_toe
    @display_board = DisplayBoard.new(piece_gateway)
    @place_piece = PlacePiece.new(piece_gateway)
  end

  def display_board
    @display_board.execute({})
  end

  def place_piece(type, position)
    @place_piece.execute(position: position, type: type)
  end

  it 'can display an empty board' do
    @tic_tac_toe = new_tic_tac_toe

    response = display_board

    expect(response[:board]).to(
      eq(
        [
          %i[_ _ _],
          %i[_ _ _],
          %i[_ _ _]
        ]
      )
    )
    expect(response[:status]).to eq(:in_progress)
  end

  it 'can place a piece' do
    @tic_tac_toe = new_tic_tac_toe

    place_piece(:x, 1)

    expect(display_board[:board]).to(
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
    @tic_tac_toe = new_tic_tac_toe

    place_piece(:x, 1)
    place_piece(:o, 2)

    expect(display_board[:board]).to(
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
    @tic_tac_toe = new_tic_tac_toe

    place_piece(:x, 1)
    place_piece(:o, 2)
    place_piece(:x, 3)

    expect(display_board[:board]).to(
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
    @tic_tac_toe = new_tic_tac_toe

    place_piece(:x, 1)
    place_piece(:o, 2)
    place_piece(:x, 3)
    place_piece(:o, 6)

    expect(display_board[:board]).to(
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
    @tic_tac_toe = new_tic_tac_toe

    place_piece(:x, 1)
    place_piece(:o, 2)
    place_piece(:x, 3)
    place_piece(:o, 6)
    place_piece(:x, 7)

    expect(display_board[:board]).to(
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
    @tic_tac_toe = new_tic_tac_toe
    place_piece(:x, 1)
    place_piece(:o, 2)
    place_piece(:x, 3)
    place_piece(:o, 6)
    place_piece(:x, 7)

    @tic_tac_toe = new_tic_tac_toe
    expect(display_board[:board]).to(
      eq(
        [
          %i[x o x],
          %i[_ _ o],
          %i[x _ _]
        ]
      )
    )
  end

  it 'can detect a win for x' do
    @tic_tac_toe = new_tic_tac_toe
    place_piece(:x, 5)
    place_piece(:o, 2)
    place_piece(:x, 6)
    place_piece(:o, 3)
    place_piece(:x, 4)
    place_piece(:o, 9)

    @tic_tac_toe = new_tic_tac_toe
    expect(display_board[:board]).to(
      eq(
        [
          %i[_ o o],
          %i[x x x],
          %i[_ _ o]
        ]
      )
    )
    expect(display_board[:status]).to eq(:x_wins)
  end

  it 'can detect a win for o' do
    @tic_tac_toe = new_tic_tac_toe
    place_piece(:x, 2)
    place_piece(:o, 7)
    place_piece(:x, 3)
    place_piece(:o, 8)
    place_piece(:x, 4)
    place_piece(:o, 9)

    @tic_tac_toe = new_tic_tac_toe
    expect(display_board[:board]).to(
      eq(
        [
          %i[_ x x],
          %i[x _ _],
          %i[o o o]
        ]
      )
    )
    expect(display_board[:status]).to eq(:o_wins)
  end
end
