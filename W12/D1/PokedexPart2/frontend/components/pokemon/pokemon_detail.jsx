export default class PokemonDetail {
  constructor(props) {
    super(props)
  }

  componentDidMount() {
    this.props.requestSinglePokemon(this.props.match.params.pokemonId)
  }

  render() {
    debugger
  }
}