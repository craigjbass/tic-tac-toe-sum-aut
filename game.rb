$LOAD_PATH << "#{__dir__}/lib/"

require 'tic_tac_toe'


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

gateway = InMemoryPieceGateway.new

place_piece = PlacePiece.new(gateway)
display_board = DisplayBoard.new(gateway)

while true do
  pos = 1 
  display_board.execute({})[:board].each do |row|
    row.each do |cell|
      print '|'
      print cell == :_ ? pos : cell
      pos += 1
    end
    print '|'
    puts
  end
  puts

  print "position: "
  input = gets.to_i 

  print "piece: "
  symbol = gets.strip.to_sym

  place_piece.execute(position: input, type: symbol)
end
