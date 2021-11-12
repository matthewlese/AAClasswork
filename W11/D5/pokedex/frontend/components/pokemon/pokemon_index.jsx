import React from "react";

class PokemonIndex extends React.Component{

    constructor(props){
        super(props)
    }
    componentDidMount(){
        this.props.requestAllPokemon()
    }
    render(){
        console.log(this.props.pokemons)
        return (
          <ul>
            {this.props.pokemons.map((pokemon, id) => (
              <li key={id}>
                <img
                  src={pokemon.image_url}
                  alt="pokemon-img"
                  className="poke-img"
                />
                {pokemon.name}
              </li>
            ))}
          </ul>
        );
    }
}

export default PokemonIndex; 