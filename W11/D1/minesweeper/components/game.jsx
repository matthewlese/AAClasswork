import React from 'react'
import * as Minesweeper from '../minesweeper'
import Board from './board'
import Modal from './modal'

export default class Game extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      board: new Minesweeper.Board(8, 8)
    }
    this.updateGame = this.updateGame.bind(this);
    this.restartGame = this.restartGame.bind(this)
  }

  restartGame() {
    this.setState({ 
      board: new Minesweeper.Board(8, 8)
    })
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
    let winOrLoss = "";
    let show = false;
    if (this.state.board.won()){
      show = true;
      winOrLoss += "You won!"
    } else if (this.state.board.lost()){
      show = true;
      winOrLoss += "You lost!"
    }
    return(
      <div className="game">
        <Modal show={show} winOrLoss={winOrLoss} restartGame={this.restartGame}/>

        <Board board={this.state.board} updateGame={this.updateGame} />
      </div>
    )
  }
}