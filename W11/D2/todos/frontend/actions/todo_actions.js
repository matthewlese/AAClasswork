export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";
export const DELETE_TODO = "DELETE_TODO"

export const receiveTodos = (todos) => ({
  type: RECEIVE_TODOS,
  todos
});

export const receiveTodo = (todo) => ({
  type: RECEIVE_TODO,
  todo
})

export const removeTodo = (todo) => ({
  type: DELETE_TODO,
  todo
})