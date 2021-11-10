import React from 'react'
import ReactDOM from 'react-dom'
import configureStore from './store/store'
import {receiveTodo, receiveTodos, removeTodo} from './actions/todo_actions'
import {receiveStep, receiveSteps, removeStep} from './actions/step_actions'

document.addEventListener("DOMContentLoaded", () => {
	const content = document.getElementById("content")
  const store = configureStore()

  window.store = store
  window.receiveTodos = receiveTodos;
  window.receiveTodo = receiveTodo;
  window.removeTodo = removeTodo
  window.receiveSteps = receiveSteps;
  window.receiveStep = receiveStep;
  window.removeStep = removeStep

	
	ReactDOM.render(<h1>Todos App</h1>, content)
})