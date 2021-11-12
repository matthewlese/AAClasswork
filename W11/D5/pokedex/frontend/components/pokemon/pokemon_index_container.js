import { connect } from "react-redux";
import { selectAllPokemon } from "../../reducers/selectors";
import { requestAllPokemon } from "../../actions/pokemon_actions";
import PokemonIndex from "./pokemon_index";


const mSTP = state => ({
    pokemons: selectAllPokemon(state)
})

const mDTP = dispatch => ({
    requestAllPokemon: () => dispatch(requestAllPokemon())

})

export default connect(mSTP, mDTP)(PokemonIndex);