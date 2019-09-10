# frozen_string_literal: true

describe PlacePiece do
  class PieceGatewaySpy
    attr_reader :last_saved_piece

    def save_piece(piece)
      @last_saved_piece = piece
    end
  end

  it 'can place an x piece' do
    spy = PieceGatewaySpy.new

    place_piece = described_class.new(spy)

    place_piece.execute(position: 1, type: :x)

    expect(spy.last_saved_piece.position).to eq(1)
    expect(spy.last_saved_piece.type).to eq(:x)
  end

  it 'can place an o piece' do
    spy = PieceGatewaySpy.new

    place_piece = described_class.new(spy)

    place_piece.execute(position: 8, type: :o)

    expect(spy.last_saved_piece.position).to eq(8)
    expect(spy.last_saved_piece.type).to eq(:o)
  end
end
