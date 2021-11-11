import React from 'react'
import uniqueId from '../../util/unique_id'

class TodoForm extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      title: '',
      body: '',
      done: false,
      id: uniqueId()
    }
    this.updateTitle = this.updateTitle.bind(this)
    this.updateBody = this.updateBody.bind(this)
    this.updateDone = this.updateDone.bind(this)
    this.handleSubmit = this.handleSubmit.bind(this)
  }

  handleSubmit(e) {
    e.preventDefault()
    let todo = this.state
    this.props.receiveTodo(todo)
    this.setState({
      title: '',
      body: '',
      done: false,
      id: uniqueId()
    })
  }

  updateTitle(e) {
		this.setState({
			title: e.target.value
		})
	}
  updateBody(e) {
		this.setState({
			body: e.target.value
		})
	}
  updateDone(e) {
		this.setState({
			done: e.target.value
		})
	}

  render() {
    return(
      <>
        <h2>Create a New ToDo</h2>
        <form onSubmit={this.handleSubmit}>
          <label>Title
            <input type="text" onChange={this.updateTitle} value={this.state.title}/>
          </label>
          <br />
          <label>Body
            <input type="text" onChange={this.updateBody} value={this.state.body}/>
          </label>
          <br />
          <label>Done
            <input type="checkbox" onChange={this.updateDone} value={this.state.done}/>
          </label>
          <br />
          <input type='submit' value='Submit' />
        </form>
      </>
    )
  }
}

export default TodoForm