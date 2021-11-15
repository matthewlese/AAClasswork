export const fetchAllPokemon = () => {
  return $.ajax({
    method: "GET",
    url: "/api/pokemon"
  })
}

export const fetchSinglePokemon = (PokemonId) => {
  return $.ajax({
    method: "GET",
    url: `/api/pokemon/${PokemonId}`
  })
}

