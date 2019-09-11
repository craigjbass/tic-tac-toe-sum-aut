describe InMemoryPieceGateway do
  it 'can fetch no pieces' do
    gateway = described_class.new
    expect(gateway.pieces).to eq([])
  end

  it 'can fetch one piece' do
    gateway = described_class.new
    gateway.save_piece(Piece.new.tap do |p|
      p.position = 1
      p.type = :x
    end)
    expect(gateway.pieces.length).to eq(1)
    expect(gateway.pieces[0].position).to eq(1)
    expect(gateway.pieces[0].type).to eq(:x)
  end

  it 'can fetch three pieces' do
    gateway = described_class.new
    gateway.save_piece(Piece.new.tap do |p|
      p.position = 1
      p.type = :x
    end)

    gateway.save_piece(Piece.new.tap do |p|
      p.position = 9
      p.type = :x
    end)

    gateway.save_piece(Piece.new.tap do |p|
      p.position = 2
      p.type = :o
    end)
    expect(gateway.pieces.length).to eq(3)
    expect(gateway.pieces[0].position).to eq(1)
    expect(gateway.pieces[0].type).to eq(:x)

    expect(gateway.pieces[1].position).to eq(9)
    expect(gateway.pieces[1].type).to eq(:x)

    expect(gateway.pieces[2].position).to eq(2)
    expect(gateway.pieces[2].type).to eq(:o)
  end
end
