import React from "react"
<<<<<<< HEAD
=======

>>>>>>> 319504152fb677b31ed0ae7b61158ff675b6a145
class Clock extends React.Component {
  constructor(props) { //first
    super(props)
    this.state = {
      date: 0
    }
    this.tick = this.tick.bind(this)
<<<<<<< HEAD
  }
  tick() {
    this.setState({ date: this.state.date + 1 })
    // this.props.tick()
  }

  render() {
    return (
      <div>Our Clock</div> //second
    )
  }
  componentDidMount() { // third
    setInterval(this.tick(), 1000)
  }
}
=======
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
>>>>>>> 319504152fb677b31ed0ae7b61158ff675b6a145
