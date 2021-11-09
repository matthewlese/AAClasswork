import {RECEIVE_TODOS, RECEIVE_TODO} from "../actions/todo_actions"
import { receiveTodo, receiveTodos } from "../actions/todo_actions";

const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true
  }
};

const todosReducer = (state = initialState, action) => {
  Object.freeze(state)
  let nextState = {};
  switch (action.type) {
    // will have other cases
    case RECEIVE_TODO:
      nextState = Object.assign({}, state) // not accounting for pre-existing
      return nextState[action.todo.id] = action.todo
    case RECEIVE_TODOS:
      // foreach then recur
      return nextState[action.todos.id] = action.todos
    default:
      return state;
  }
};

export default todosReducer;