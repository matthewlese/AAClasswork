const View = require("./ttt-view.js")
const Game = require("../ttt_node/game.js")
document.addEventListener("DOMContentLoaded", () => {
  const figure = document.getElementsByClassName("ttt");
  let newGame = new Game();
  new View(newGame, figure);
  
});

let game1 = new Game();
