import { connect } from 'react-redux'
import TodoDetailView from './todo_list'
// import allTodos from '../../reducers/selectors'
import { removeTodo } from '../../actions/todo_actions'

// const mapStateToProps = (state) => ({
//   todos: allTodos(state)
// })

const mapDispatchToProps = (dispatch) => ({
  // receiveTodo: todo => dispatch(receiveTodo(todo)),
  removeTodo: todo => dispatch(removeTodo(todo))
})

export default connect(
  null, 
  mapDispatchToProps
)(TodoDetailView)