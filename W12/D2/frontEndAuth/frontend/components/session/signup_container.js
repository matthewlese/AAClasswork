import { connect } from "react-redux";
import { createNewUser } from '../../actions/session'
import Signup from './signup'

// component does not rely on our state, so no need for mSTP

const mapDispatchToProps = dispatch => ({
  createNewUser: formUser => dispatch(createNewUser(formUser))
})

export default connect(null, mapDispatchToProps)(Signup)