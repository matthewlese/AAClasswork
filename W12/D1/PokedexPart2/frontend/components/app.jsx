import React from "react";
// import { Route, Switch, Routes } from "react-router";
import { Route, Switch, Routes } from "react-router-dom";

import PokemonIndexContainer from './pokemon/pokemon_index_container'

const App = () => (
  // <Routes>
    <Route path="/" component={PokemonIndexContainer} />
  // </Routes>
)

export default App