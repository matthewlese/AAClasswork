import React from "react";
import { Link } from "react-router-dom";

const Greeting = ({currentUser, logout}) => {
  return currentUser ? (
    <div className='valid-user-header'>
      <h1>Hello, {currentUser.username}!</h1>
      <button className='signout-button' onClick={logout}>Sign Out</button>
    </div>
  ) : (
    <div className='no-valid-user-header'>
      <Link to='/signup'>Signup</Link>
      <Link to='/login'>Sign In</Link>
    </div>
  )
}

export default Greeting