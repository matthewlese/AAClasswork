import { RECEIVE_CURRENT_USER, LOGOUT_CURRENT_USER } from "../actions/session";

const _nullSession = { // if no current user, return this POJO
  currentUser: null
}

export default (state = _nullSession, action) => {
  Object.freeze(state)
  switch (action.type) {
    case RECEIVE_CURRENT_USER:
      return Object.assign({}, { currentUser: action.user }) // return new slice of state with current user nested under key
    case LOGOUT_CURRENT_USER:
      return _nullSession
    default:
      return state
  }
}