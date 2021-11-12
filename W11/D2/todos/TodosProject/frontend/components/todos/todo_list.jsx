import React from 'react'
import TodoForm from './todo_form'
import TodoListItem from './todo_list_item'

const TodoList = (props) => {
  return (<>
    <ul>
      {
        props.todos.map((todo, i) => <TodoListItem key={i} todo={todo} receiveTodo={props.receiveTodo} removeTodo={props.removeTodo}/>)
      }
    </ul>
    <TodoForm receiveTodo={props.receiveTodo}/>
  </>)
}

export default TodoList