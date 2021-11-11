import React from 'react'
import TodoForm from './todo_form'
import TodoListItem from './todo_list_item'

const TodoDetailView = (props) => {
  
  return (
    <>
      <div>
        {props.todo.body}
      </div>
    </>
  )
}

export default TodoDetailView