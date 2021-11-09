import React from 'react'
import ReactDOM from 'react-dom'
import configureStore from './store/store'
import {receiveTodo, receiveTodos} from './actions/todo_actions'

document.addEventListener("DOMContentLoaded", () => {
	const content = document.getElementById("content")
  const store = configureStore()

  window.store = store
  window.receiveTodos = receiveTodos;
  window.receiveTodo = receiveTodo;
	
	ReactDOM.render(<h1>Todos App</h1>, content)
})