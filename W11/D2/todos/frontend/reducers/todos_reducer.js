import {RECEIVE_TODOS, RECEIVE_TODO, DELETE_TODO} from "../actions/todo_actions"
// import { receiveTodo, receiveTodos, removeTodo } from "../actions/todo_actions";

const initialState = {
  1: {
    id: 1,
    title: 'take a shower',
    body: 'and be clean',
    done: false
  }
};

const todosReducer = (state = initialState, action) => {
  Object.freeze(state)
  let nextState = {};
  switch (action.type) {
    case RECEIVE_TODO:
      nextState = Object.assign({}, state)
      nextState[action.todo.id] = action.todo
      return nextState
    case RECEIVE_TODOS:
      action.todos.forEach((todo) => {
        nextState[todo.id] = todo
      })
      return nextState
    case DELETE_TODO:
      nextState = Object.assign({}, state)
      delete nextState[action.todo.id]
      return nextState
    default:
      return state;
  }
};

export default todosReducer;