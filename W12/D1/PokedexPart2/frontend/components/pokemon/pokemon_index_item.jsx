import React from "react";

const PokemonIndexItem = (props) => (
  <li className="pokemon-index-item" key={props.pokemon.id}>
    <span>{props.pokemon.id}</span>
    <img src={props.pokemon.imageUrl}/>
    <span>{props.pokemon.name}</span>
  </li>
)

export default PokemonIndexItem