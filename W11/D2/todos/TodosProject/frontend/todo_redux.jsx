import React from 'react'
import ReactDOM from 'react-dom'
import configureStore from './store/store'
import {receiveTodo, receiveTodos, removeTodo, fetchTodos} from './actions/todo_actions'
import {receiveStep, receiveSteps, removeStep} from './actions/step_actions'
import Root from './components/root'
import allTodos from './reducers/selectors'
import * as todoApiUtil from './util/todo_api_util'

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
  window.allTodos = allTodos
  window.todoApiUtil = todoApiUtil
  window.fetchTodos = fetchTodos
	
	ReactDOM.render(<Root store={store} />, content)
})