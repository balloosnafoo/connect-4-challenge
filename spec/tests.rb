require './lib/board'

describe Board do
  let(:board) { Board.new(10, 10, 4) }

  it "returns false on a non winning move" do
    expect(board.execute_move(0, :white)).to be false
  end

  it "detects a horizontal win" do
    expect(board.execute_move(0, :white)).to be false
    expect(board.execute_move(1, :white)).to be false
    expect(board.execute_move(2, :white)).to be false
    expect(board.execute_move(3, :white)).to be true
  end

  it "detects a vertical win" do
    expect(board.execute_move(0, :white)).to be false
    expect(board.execute_move(0, :white)).to be false
    expect(board.execute_move(0, :white)).to be false
    expect(board.execute_move(0, :white)).to be true
  end

  it "detects a diagonal win" do
    expect(board.execute_move(0, :white)).to be false
    expect(board.execute_move(1, :red)).to be false
    expect(board.execute_move(1, :white)).to be false
    expect(board.execute_move(2, :red)).to be false
    expect(board.execute_move(2, :red)).to be false
    expect(board.execute_move(2, :white)).to be false
    expect(board.execute_move(3, :red)).to be false
    expect(board.execute_move(3, :red)).to be false
    expect(board.execute_move(3, :red)).to be false
    expect(board.execute_move(3, :white)).to be true
  end
end
