import React from 'react';
import ReactDOM from "react-dom";
import {receiveAllPokemon, requestAllPokemon} from "./actions/pokemon_actions"
import { fetchAllPokemon } from './util/api_util';
import configureStore from "./store/store";
import { selectAllPokemon } from './reducers/selectors'
import Root from "./components/root";


document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  const store = configureStore();
  window.getState = store.getState
  window.dispatch = store.dispatch
  window.store = store;
  window.receiveAllPokemon = receiveAllPokemon;
  window.requestAllPokemon = requestAllPokemon
  window.fetchAllPokemon = fetchAllPokemon
  window.selectAllPokemon = selectAllPokemon
  ReactDOM.render(<Root store={store} />, root);
  // ReactDOM.render(<h1>Pokedex</h1>, root);
});