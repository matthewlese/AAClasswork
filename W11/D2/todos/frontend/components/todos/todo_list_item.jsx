import React from 'react'
import TodoDetailView from './todo_detail_view'

// const TodoListItem = (props) => {
class TodoListItem extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      detail: false
    }
  }

  // function toggleDone() {
  toggleDone() {
    let newTodo = props.todo
    newTodo.done = !newTodo.done
    props.receiveTodo(newTodo)
  }

  toggleDetails() {
    this.state.detail = !this.state.detail
  }

  render() {
    return (
    <li onClick={this.toggleDetails}>{this.props.todo.title}

      {/* <button onClick={() => props.removeTodo(props.todo)}>Delete</button> */}
      <label>Done
        {/* <input type="checkbox" onClick={() => function(arg)} value={props.todo.done}/> */}
        <input type="checkbox" onClick={this.toggleDone} value={this.props.todo.done}/>
      </label>
      
      <TodoDetailView todo={this.props.todo}/>
    </li>
    )
  }
}

export default TodoListItem