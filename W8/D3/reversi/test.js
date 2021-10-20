const Piece = require("./src/piece");
const Board = require("./src/board");

// const testPiece = new Piece('white');
// testPiece.flip();

// with two black pieces at[3, 4] and[4, 3]
// and two white pieces at[3, 3] and[4, 4]
const testBoard = new Board();
testBoard.grid[3][2] = new Piece('black');
testBoard.grid[3][1] = new Piece('white');
testBoard._positionsToFlip([3, 3], "white", [0, -1]);