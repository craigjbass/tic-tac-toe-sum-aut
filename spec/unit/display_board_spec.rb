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

  def create_pieces(*grid)
    pieces = []
    grid.each_with_index do |p, i|
      pieces << create_piece(i+1, p)
    end
    pieces
  end

  it 'can display an empty board' do
    display_board = described_class.new(StubPieceGateway.new([]))

    response = display_board.execute({})

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
    display_board = described_class.new(StubPieceGateway.new([]))

    response = display_board.execute({})

    expect(response[:status]).to eq(:in_progress)
  end

  it 'can display one piece' do
    pieces = [
      create_piece(9, :x)
    ]

    stub = StubPieceGateway.new(pieces)

    display_board = described_class.new(stub)

    response = display_board.execute({})

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
    pieces = [
      create_piece(3, :o)
    ]

    stub = StubPieceGateway.new(pieces)

    display_board = described_class.new(stub)

    response = display_board.execute({})

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
    pieces = [
      create_piece(3, :o),
      create_piece(5, :x)
    ]

    stub = StubPieceGateway.new(pieces)

    display_board = described_class.new(stub)

    response = display_board.execute({})

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
    pieces = create_pieces(
      :_, :_, :_,
      :x, :x, :x,
      :_, :_, :_
    )

    stub = StubPieceGateway.new(pieces)

    display_board = described_class.new(stub)

    response = display_board.execute({})

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
