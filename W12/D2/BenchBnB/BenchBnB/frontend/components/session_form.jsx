import React from "react";
import { Link } from "react-router-dom";

class SessionForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      username: "",
      password: ""
    };
    this.handleSubmit = this.handleSubmit.bind(this)
  }

  handleSubmit(e) {
    e.preventDefault();
    const user = Object.assign({}, this.state);
    this.props.processForm(user);
  }

  handleInput(field) {
    return (e) => {
      this.setState({ [field]: e.target.value })
    }
  }

  displayErrors() {
    return(
      <ul className='error-list'>
        {this.props.errors.map((err, i) => (
            <li key={i}>{err}</li>
        ))}
      </ul>
    )
  }

  createLink() {
    if (this.props.formType === 'signup') {
      return <Link to='/login'>Log In</Link>
    } else {
      return <Link to='/signup'>Sign Up</Link>
    }
  }

  render() {
    return (
      <div className="session-form">
        <h2>{this.props.formType}</h2>
        {this.createLink()}
        {this.displayErrors()}
        <form onSubmit={this.handleSubmit}>
          <label>Username:
            <input type='text' value={this.state.username} onChange={this.handleInput('username')} />
          </label>
          <label>Password:
            <input type='password' value={this.state.password} onChange={this.handleInput('password')} />
          </label>
          <input type='submit' value={this.props.formType} />
        </form>
      </div>
    )
  }
}

export default SessionForm