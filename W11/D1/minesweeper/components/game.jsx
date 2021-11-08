import React from 'react'
import * as Minesweeper from '../minesweeper'

export default class Game extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      board: new Minesweeper.Board(8, 8)
    }
  }

  updateGame() {

  }

  render() {
    return(
      <div> inside game.jsx
        <Board board={this.state.board} updateGame={this.updateGame} />
      </div>
    )
  }
}