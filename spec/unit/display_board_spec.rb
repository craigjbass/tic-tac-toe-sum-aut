describe DisplayBoard do
  class StubPieceGateway
    def initialize(pieces)
      @pieces = pieces
    end

    def pieces
      @pieces
    end
  end

  it 'can display an empty board' do
    display_board = described_class.new(StubPieceGateway.new([]))

    response = display_board.execute({})

    expect(response[:board]).to(
      eq(
        [
          [:_, :_, :_],
          [:_, :_, :_],
          [:_, :_, :_]
        ]
      )
    )
  end

  it 'can display one piece' do
    pieces = [
      Piece.new.tap do |piece|
        piece.position = 9
        piece.type = :x
      end
    ]

    stub = StubPieceGateway.new(pieces)

    display_board = described_class.new(stub)

    response = display_board.execute({})

    expect(response[:board]).to(
      eq(
        [
          [:_, :_, :_],
          [:_, :_, :_],
          [:_, :_, :x]
        ]
      )
    )
  end

  it 'can display another single piece' do
    pieces = [
      Piece.new.tap do |piece|
        piece.position = 3
        piece.type = :o
      end
    ]

    stub = StubPieceGateway.new(pieces)

    display_board = described_class.new(stub)

    response = display_board.execute({})

    expect(response[:board]).to(
      eq(
        [
          [:_, :_, :o],
          [:_, :_, :_],
          [:_, :_, :_]
        ]
      )
    )
  end

  it 'can display multiple pieces' do
    pieces = [
      Piece.new.tap do |piece|
        piece.position = 3
        piece.type = :o
      end,
      Piece.new.tap do |piece|
        piece.position = 5
        piece.type = :x
      end
    ]

    stub = StubPieceGateway.new(pieces)

    display_board = described_class.new(stub)

    response = display_board.execute({})

    expect(response[:board]).to(
      eq(
        [
          [:_, :_, :o],
          [:_, :x, :_],
          [:_, :_, :_]
        ]
      )
    )
  end
end
