import React from "react"

class Clock extends React.Component {
  constructor(props) { //first
    super(props)
    this.state = {
      date: 0
    }
    this.tick = this.tick.bind(this)
  }

  tick() {
    this.setState({date: this.state.date + 1})
    // this.props.tick()
  }

  
  render(){
    return (
      <div>Our Clock</div> //second
      )
    }

  componentDidMount() { // third
    setInterval(this.tick(), 1000)
  }
}

export default Clock