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

  def expect_board_in_response_to_eq(*expected, response)
    expect(response[:board]).to eq(expected)
  end


  it 'can display an empty board' do
    response = display_board_for grid_pieces(
      :_, :_, :_,
      :_, :_, :_,
      :_, :_, :_
    )

    expect_board_in_response_to_eq(
      %i[_ _ _],
      %i[_ _ _],
      %i[_ _ _],
      response
    )
  end

  it 'can display one piece' do
    response = display_board_for grid_pieces(
      :_, :_, :_,
      :_, :_, :_,
      :_, :_, :x
    )

    expect_board_in_response_to_eq(
      %i[_ _ _],
      %i[_ _ _],
      %i[_ _ x],
      response
    )
  end

  it 'can display another single piece' do
    response = display_board_for grid_pieces(
      :_, :_, :o,
      :_, :_, :_,
      :_, :_, :_
    )

    expect_board_in_response_to_eq(
      %i[_ _ o],
      %i[_ _ _],
      %i[_ _ _],
      response
    )
  end

  it 'can display multiple pieces' do
    response = display_board_for grid_pieces(
      :_, :_, :o,
      :_, :x, :_,
      :_, :_, :_
    )

    expect_board_in_response_to_eq(
      %i[_ _ o],
      %i[_ x _],
      %i[_ _ _],
      response
    )
  end

  [
    [
      :_, :_, :_,
      :_, :_, :_,
      :_, :_, :_
    ],
    [
      :_, :x, :o,
      :x, :_, :_,
      :o, :_, :x
    ],
  ].each do |example_grid|
    it 'can report the game as in progress' do
      response = display_board_for grid_pieces(*example_grid)
      expect(response[:status]).to eq(:in_progress)
    end
  end

  [
    [
      :_, :_, :_,
      :x, :x, :x,
      :_, :_, :_
    ],
    [
      :x, :x, :x,
      :_, :_, :_,
      :_, :_, :_
    ],
    [
      :_, :_, :_,
      :_, :_, :_,
      :x, :x, :x
    ],
    [
      :x, :_, :_,
      :x, :_, :_,
      :x, :_, :_
    ],
    [
      :_, :x, :_,
      :_, :x, :_,
      :_, :x, :_
    ],
    [
      :_, :_, :x,
      :_, :_, :x,
      :_, :_, :x
    ]
  ].each do |grid_example|
    it 'can detect a win for x' do
      response = display_board_for grid_pieces(*grid_example)
      expect(response[:status]).to eq(:x_wins)
    end
  end
end
