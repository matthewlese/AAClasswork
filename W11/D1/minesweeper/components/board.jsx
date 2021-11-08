import React from 'react'
import Tile from './tile'

export default class Board extends React.Component{
  constructor(props) {
    super(props)
  }

  boardRows(){
    return this.props.board.grid.map((row, i) => {
      // console.log(row);
      return (
        // console.log(i);
        <div key={i} className="row">
          {this.rowTiles(row,i)}
        </div>
      )
    })
  }

  rowTiles(row,i){
    return row.map((tile,j)=>{
      return (<Tile key={j} tileObj={tile} updateGame={this.props.updateGame}/>)
    })
  }



  render(){
    return (
      <div className="board">
        {this.boardRows()}
      </div>
    )
  }
}