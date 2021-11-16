import { RECEIVE_ALL_POKEMON, RECEIVE_SINGLE_POKEMON } from './../actions/pokemon_actions';


const pokemonReducer = (state = {}, action) => {
  Object.freeze(state);
  let nextState = Object.assign({}, state)
  switch (action.type){
  case RECEIVE_ALL_POKEMON:
    return Object.assign({}, action.pokemon, state);
  case RECEIVE_SINGLE_POKEMON:
    nextState[action.payload.pokemon.id] = action.payload.pokemon
    return nextState
    // return Object.assign({}, action.payload.pokemon);
  default:
    return state;
  }
}
  
export default pokemonReducer;
