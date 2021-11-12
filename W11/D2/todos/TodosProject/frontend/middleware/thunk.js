export const middleFunc = (action) => {
  if (typeof action === 'function') {
    return action(dispatch, getState)
  } else {
    return next(action)
  }
}