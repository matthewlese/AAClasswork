import React from 'react'

export default class Tile extends React.Component{
  constructor(props) {
    super(props)
    // console.log(this.props)
    this.handleClick = this.handleClick.bind(this);
  }
  

  handleClick(e){
    let flagging = e.altKey ? true : false;
    this.props.updateGame(this.props.tileObj, flagging)
  }

  render(){
    let className = 'tile';
    let contentCode = '';
    if (this.props.tileObj.explored){
      if (this.props.tileObj.bombed) {
        className += ' bombed'
        contentCode = '\u{1F4A3}'
        // contentCode = '&#128163'
        // content = '\u1F4A3'
      } else if (this.props.tileObj.explored) {
        className += ' explored'
        contentCode = this.props.tileObj.adjacentBombCount()
      } 
    } else if(this.props.tileObj.flagged){
      className += ' flagged'
      contentCode = 'F'
      //&#128681
    }


    return(
      <div className={className} onClick={this.handleClick}>
        {contentCode}
      </div>
    )
  }

}