describe InMemoryPieceGateway do
  let(:gateway) { described_class.new }

  def save_piece(position:, type:)
    gateway.save_piece(Piece.new.tap do |p|
      p.position = position
      p.type = type
    end)
  end

  it 'can fetch no pieces' do
    expect(gateway.pieces).to eq([])
  end

  it 'can fetch one piece' do
    save_piece(position: 1, type: :x)
    expect(gateway.pieces.length).to eq(1)
    expect(gateway.pieces[0].position).to eq(1)
    expect(gateway.pieces[0].type).to eq(:x)
  end

  it 'can fetch three pieces' do
    save_piece(position: 1, type: :x)
    save_piece(position: 9, type: :x)
    save_piece(position: 2, type: :o)

    expect(gateway.pieces.length).to eq(3)
    expect(gateway.pieces[0].position).to eq(1)
    expect(gateway.pieces[0].type).to eq(:x)

    expect(gateway.pieces[1].position).to eq(9)
    expect(gateway.pieces[1].type).to eq(:x)

    expect(gateway.pieces[2].position).to eq(2)
    expect(gateway.pieces[2].type).to eq(:o)
  end

  it 'ensures immutability of returned instances' do
    save_piece(position: 2, type: :o)

    gateway.pieces[0].position = 3

    expect(gateway.pieces[0].position).to eq(2)
  end
end
