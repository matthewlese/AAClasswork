import { RECEIVE_ERRORS, RECEIVE_CURRENT_USER } from '../actions/session_actions'

export default (state=[], action) => {
  Object.freeze(state);

  switch (action.type) {
    case RECEIVE_ERRORS:
      return action.errors
      // find out how to make an array for errors.
    case RECEIVE_CURRENT_USER:
      return []
    default:
      return state;
  }
}