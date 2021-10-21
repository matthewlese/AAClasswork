// DON'T TOUCH THIS CODE
if (typeof window === 'undefined'){
  var Piece = require("./piece");
}
// DON'T TOUCH THIS CODE

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  // let grid = new Array(8).fill(new Array(8))
  let grid = new Array(8).fill().map(ele => new Array(8));
  // for (let i=0; i<grid.length; i++ ) {
  //   grid[i] = new Array(8);
  // }
  grid[3][4] = new Piece('black');
  grid[4][3] = new Piece('black');
  grid[3][3] = new Piece('white');
  grid[4][4] = new Piece('white');

  return grid;
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Checks if a given position is on the Board.
 */
// expect(testBoard.isValidPos([9, 1])).toEqual(false);
Board.prototype.isValidPos = function (pos) {
  let row = pos[0];
  let col = pos[1];
  if (row < 0 || row > 7 || col < 0 || col > 7) {
    return false;
  }
  return true;
};

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  if (!this.isValidPos(pos)) {
    throw Error('Not valid pos!');
  }
  let row = pos[0];
  let col = pos[1];
  return this.grid[row][col];
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  if (!this.isOccupied(pos)) {return false};
  return (this.getPiece(pos).color === color) ? true : false;
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  return this.getPiece(pos) ? true : false;
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns an empty array if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns empty array if it hits an empty position.
 *
 * Returns empty array if no pieces of the opposite color are found.
 */
Board.prototype._positionsToFlip = function(pos, color, dir, piecesToFlip){
  try {
    this.getPiece(pos);
  } catch (error) {
    console.log(error);
    return [];
  }

  let result = piecesToFlip ? piecesToFlip : [];

  let newRow = pos[0] + dir[0];
  let newCol = pos[1] + dir[1];
  let newPos = [newRow, newCol];
  if (!this.isOccupied(newPos)) { return result };
  if (this.getPiece(newPos).color === color) { return result };

  result.push(newPos);
  return this._positionsToFlip(newPos, color, dir, result);
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  finalResult = false;
  if (this.isOccupied(pos)) { return false };
  let colorPositions = [];
  for (let row=0; row<7; row++) {
    for (let col=0; col<7; col++) {
      let tempPos = [row, col];
      if (this.isOccupied(tempPos) && this.getPiece(tempPos).color === color) {
        colorPositions.push(tempPos);
      }
    }
  }
  colorPositions.forEach(cPos => {
    let rowDisp = cPos[0] - pos[0];
    let colDisp = cPos[1] - pos[1];
    let displacement = [rowDisp, colDisp];
    Board.DIRS.forEach(dir => {
      let valid = false;
      while (!valid) {
        displacement[0] = displacement[0] - dir[0];
        displacement[1] = displacement[1] - dir[1];
        if (displacement[0] === 0 && displacement[1] === 0) { 
          valid = true; 
        };
        if (displacement[0] < -7 || displacement[0] > 7 || displacement[1] < -7 || displacement[1] > 7) {
          break;
        }
      }
      // if (displacement[0] === 0 && displacement[1] === 0) { return true };
      // if (displacement == [0,0]) { return true };
      return true;
    });
  });
  return false;
}

/* Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
]; */

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
};



/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
};




/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
};


// DON'T TOUCH THIS CODE
if (typeof window === 'undefined'){
  module.exports = Board;
}
// DON'T TOUCH THIS CODE