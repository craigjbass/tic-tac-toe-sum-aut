describe InMemoryPieceGateway do
  let(:gateway) { described_class.new }

  def save_piece(position:, type:)
    gateway.save_piece(Piece.new.tap do |p|
      p.position = position
      p.type = type
    end)
  end

  def expect_number_of_pieces_to_be(expected)
    expect(gateway.pieces.length).to eq(expected)
  end

  def expect_piece_to_look_like(position:, type:, at_index:)
    expect(gateway.pieces[at_index].position).to eq(position)
    expect(gateway.pieces[at_index].type).to eq(type)
  end

  it 'can fetch no pieces' do
    expect(gateway.pieces).to eq([])
  end

  it 'can fetch one piece' do
    save_piece(position: 1, type: :x)

    expect_number_of_pieces_to_be(1)

    expect_piece_to_look_like(
      position: 1, 
      type: :x, 
      at_index: 0
    )
  end

  it 'can fetch three pieces' do
    save_piece(position: 1, type: :x)
    save_piece(position: 9, type: :x)
    save_piece(position: 2, type: :o)

    expect_number_of_pieces_to_be(3)

    expect_piece_to_look_like(
      position: 1, 
      type: :x, 
      at_index: 0
    )
    expect_piece_to_look_like(
      position: 9, 
      type: :x, 
      at_index: 1
    )
    expect_piece_to_look_like(
      position: 2, 
      type: :o, 
      at_index: 2
    )
  end

  it 'ensures immutability of returned instances' do
    save_piece(position: 2, type: :o)

    gateway.pieces[0].position = 3

    expect(gateway.pieces[0].position).to eq(2)
  end
end
