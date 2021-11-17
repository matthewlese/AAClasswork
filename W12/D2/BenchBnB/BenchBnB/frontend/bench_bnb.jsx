import React from "react";
import ReactDOM from "react-dom";
import configureStore from "./store/store";
import {postUser, postSession, deleteSession} from './util/session_api_util'

document.addEventListener("DOMContentLoaded", () => {
  const store = configureStore()
  const root = document.getElementById("root");
  ReactDOM.render(<h1>Welcome to BenchBnB</h1>, root);

  window.postUser = postUser
  window.postSession = postSession
  window.deleteSession = deleteSession

  window.getState = store.getState;
  window.dispatch = store.dispatch;
});