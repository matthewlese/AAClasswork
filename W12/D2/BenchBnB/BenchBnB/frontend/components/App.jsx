import React from "react";
import GreetingContainer from './greeting_container'
import { Route } from "react-router";
import SignupFormContainer from "./signup_form_container";
import LoginFormContainer from "./login_form_container";
import { HashRouter, Routes } from "react-router-dom";


const App = () => (
  <div>
    <header>
      <h1>Bench BnB</h1>
      {/* <GreetingContainer /> */}
    </header>
    <Routes>
      <Route path='/' element={<GreetingContainer/>} />
      <Route path='/signup' element={<SignupFormContainer/>} />
      <Route path='/login' element={<LoginFormContainer/>} />
    </Routes>
  </div>
);

export default App;