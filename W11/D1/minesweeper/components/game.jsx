import React from 'react'
import * as Minesweeper from '../minesweeper'
import Board from './board'

export default class Game extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      board: new Minesweeper.Board(8, 8)
    }
    this.updateGame = this.updateGame.bind(this);
  }

  updateGame(tileObj, flagging) {
    if (flagging){
      tileObj.toggleFlag();
    } else {
      tileObj.explore();
    }
    this.setState({ board: this.state.board })
  }

  render() {
    let header = "";
    console.log(this.state.board.grid)
    console.log(this.state.board.won())
    if (
      this.state.board.won()
    ){
      header += "You won!"
    } else if (this.state.board.lost()){
      header += "You lost!"
    }

    return(
      <div className="game">
        <h1>{header}</h1>
        <Board board={this.state.board} updateGame={this.updateGame} />
      </div>
    )
  }
}