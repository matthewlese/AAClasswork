import {connect} from 'react-redux';
import { requestSinglePokemon } from '../../actions/pokemon_actions';
import PokemonDetail from './pokemon_detail';

const mapStateToProps = state => ({
  pokemon: state.entities.pokemon,
  items: state.entities.items,
  moves: state.entities.moves 
})

const mapDispatchToProps = dispatch => ({
  requestSinglePokemon: () => dispatch(requestSinglePokemon())
})

export default connect(mapStateToProps, mapDispatchToProps)(PokemonDetail)