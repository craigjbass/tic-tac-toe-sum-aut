# frozen_string_literal: true

describe DisplayBoard do
  class StubPieceGateway
    def initialize(pieces)
      @pieces = pieces
    end

    attr_reader :pieces
  end

  def create_piece(position, type)
    Piece.new.tap do |piece|
      piece.position = position
      piece.type = type
    end
  end

  def grid_pieces(*flat_grid)
    pieces = []
    flat_grid.each_with_index do |t, p|
      pieces << create_piece(p+1, t)
    end
    pieces
  end

  def display_board_for(pieces)
    display_board = described_class.new(StubPieceGateway.new(pieces))
    display_board.execute({})
  end

  it 'can display an empty board' do
    response = display_board_for grid_pieces(
      :_, :_, :_,
      :_, :_, :_,
      :_, :_, :_
    )

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

  it 'can report the game as in progress' do
    response = display_board_for grid_pieces(
      :_, :_, :_,
      :_, :_, :_,
      :_, :_, :_
    )

    expect(response[:status]).to eq(:in_progress)
  end

  it 'can display one piece' do
    response = display_board_for grid_pieces(
      :_, :_, :_,
      :_, :_, :_,
      :_, :_, :x
    )

    expect(response[:board]).to(
      eq(
        [
          %i[_ _ _],
          %i[_ _ _],
          %i[_ _ x]
        ]
      )
    )
  end

  it 'can display another single piece' do
    response = display_board_for grid_pieces(
      :_, :_, :o,
      :_, :_, :_,
      :_, :_, :_
    )

    expect(response[:board]).to(
      eq(
        [
          %i[_ _ o],
          %i[_ _ _],
          %i[_ _ _]
        ]
      )
    )
  end

  it 'can display multiple pieces' do
    response = display_board_for grid_pieces(
      :_, :_, :o,
      :_, :x, :_,
      :_, :_, :_
    )

    expect(response[:board]).to(
      eq(
        [
          %i[_ _ o],
          %i[_ x _],
          %i[_ _ _]
        ]
      )
    )
  end

  it 'can detect a win for x' do
    response = display_board_for grid_pieces(
      :_, :_, :_,
      :x, :x, :x,
      :_, :_, :_
    )

    expect(response[:board]).to(
      eq(
        [
          %i[_ _ _],
          %i[x x x],
          %i[_ _ _]
        ]
      )
    )
    expect(response[:status]).to eq(:x_wins)
  end
end
