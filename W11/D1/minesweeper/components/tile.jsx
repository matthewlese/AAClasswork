import React from 'react'

export default class Tile extends React.Component{
  constructor(props) {
    super(props)
    console.log(this.props)
  }

  render(){
    let className = 'tile'
    let contentCode = 'T'
    if (this.props.tileObj.bombed) {
      className += ' bombed'
      contentCode = 'B'
      // contentCode = '&#128163'
      // content = '\u1F4A3'
    } else if (this.props.tileObj.explored) {
      className += ' explored'
      contentCode = this.props.tileObj.adjacentBombCount()
    } else if (this.props.tileObj.flagged) {
      className += ' flagged'
      contentCode = 'F'
    }
    return(
      <div className={className}>
        {contentCode}
      </div>
    )
  }

}